-- Find all clients (first and last name) billing amounts and charged date
select clients.first_name, clients.last_name, billing.amount, billing.charged_datetime
from clients
join billing on clients.id = billing.clients_id;

-- list all the domain names and leads (first and last name) for each site
select sites.domain_name, leads.first_name, leads.last_name
from sites
join leads on sites.id = leads.id;

-- Get the names of the clients, their domain names and the first names of all the leads generated from these sites.
select clients.first_name as clients_first_name, clients.last_name, sites.domain_name, leads.first_name as leads_first_name
from clients
join sites on clients.id = sites.clients_id
join leads on sites.id = leads.sites_id;

-- List all the clients and tha sites each clients has, even if the client hasn't landed a site yet
select clients.first_name, clients.last_name, sites.domain_name
from clients
left join sites on clients.id=sites.clients_id;

-- Find all the clents (first and last name) and their total billing amounts
select clients.first_name, clients.last_name, sum(billing.amount) as total_amount
from clients
join billing on clients.id = billing.clients_id
group by clients.id;

-- List all the domain names associated with each clients
select group_concat(' ', sites.domain_name) as domains, clients.first_name, clients.last_name
from clients
join sites on clients.id = sites.clients_id
group by clients.id;

-- Find the total number of leads for each site
select count(leads.id) as n_leads, sites.domain_name
from sites
join leads on sites.id = leads.sites_id
group by sites.id




