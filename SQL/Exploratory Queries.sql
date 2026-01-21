

select *
from Portfolio..CovidDeaths
order by 3,4

--select *
--from Portfolio..CovidVaccinations
--order by 3,4

-- Select data we are gone to be using

select location,date, total_cases, new_cases, total_deaths, population
from Portfolio..CovidDeaths
order by 1,2

-- Looking at Totalcases VS TotalDeaths
-- Shows likelyhood of dying if you contract covid in your country

select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as "Death Percentage"
from Portfolio..CovidDeaths
where location like '%States%' and continent is not null
order by 1,2

-- Looking at Totalcases VS Population
-- Shows what percent of population got covid

select location,date,population, total_cases, (total_cases/population)*100 as PercentPopulationAffected
from Portfolio..CovidDeaths
-- where location like '%States%'
order by 1,2

-- Looking at countries with highest infection rate compared to popualtion

select location,population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationAffected
from Portfolio..CovidDeaths
-- where location like '%States%'
group by location, population
order by PercentPopulationAffected desc

-- Showing countries with highest death count per population

select location,max(cast (total_deaths as int)) as TotalDeathCount
from Portfolio..CovidDeaths
-- where location like '%States%'
where continent is not null
group by location
order by TotalDeathCount desc

-- LETS BREAK THINGS DOWN BY CONTINENT

select continent,max(cast (total_deaths as int)) as TotalDeathCount
from Portfolio..CovidDeaths
-- where location like '%States%'
where continent is not null
group by continent
order by TotalDeathCount desc

--Showing countries with highest death count by population

select continent,max(cast (total_deaths as int)) as TotalDeathCount
from Portfolio..CovidDeaths
-- where location like '%States%'
where continent is not null
group by continent
order by TotalDeathCount desc

-- GLOBAL NUMBERS

select date, SUM(new_cases) as TotalCases, sum(new_deaths) as TotalDeaths, (SUM(new_deaths)/SUM(new_cases))*100 as "Death Percentage"
from Portfolio..CovidDeaths
-- where location like '%States%' 
WHERE continent is not null
group by date
order by 1,2

-- Looking at total population vs vaccinations

select dea.continent, dea.location, dea.date, vac.new_vaccinations, 
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Portfolio..CovidDeaths AS dea 
	join Portfolio..CovidVaccinations as vac
	on Dea.location = Vac.location
	and Dea.date = Vac.date
where dea.continent is not null
order by 2,3

-- USING CTE

WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as

(
select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations, 
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Portfolio..CovidDeaths AS dea 
	join Portfolio..CovidVaccinations as vac
	on Dea.location = Vac.location
	and Dea.date = Vac.date
where dea.continent is not null
)
select *, (RollingPeopleVaccinated/population)*100
from PopvsVac

--TEMP TABLE

CREATE TABLE #PercentPopulationVaccinated1
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated1
select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations, 
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Portfolio..CovidDeaths AS dea 
	join Portfolio..CovidVaccinations as vac
	on Dea.location = Vac.location
	and Dea.date = Vac.date
-- where dea.continent is not null

select *, (RollingPeopleVaccinated/population)*100
from #PercentPopulationVaccinated1

-- Creating view to store data for later visualizations

Create view PercentPopulationVaccinated1 AS
select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations, 
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Portfolio..CovidDeaths AS dea 
	join Portfolio..CovidVaccinations as vac
	on Dea.location = Vac.location
	and Dea.date = Vac.date
where dea.continent is not null
-- order by 2,3

SELECT *
FROM PercentPopulationVaccinated1

