Data Model
==========

Security Model
--------------

At present there are only two levels of user:

- **Site Administrators** : These are the users that can perform administrative duties to the site. They can create users and events.
- **Local Game Control** : These are the city GC who are responsible for entering location information for each month's event.

City Model
----------

The city model is flexible, which could make it feel initially confusing. The website must accomodate several different models of city events. The city connectivity covers the following scenarios:

1. Just a city. No big deal. Most cities of small- to mid-size and cities that have only been participating for a year or two fit into this category. For instance, Pittsburgh has a single team of GC members and a single location.
2. A city with one set of GC but multiple locations. Portland falls into this category. There is one large set of GC members. Sometimes events are held at a single location for all players. Sometimes events are held at two nearby locations, with half of GC going to each. Often the “sub cities” have nonsense names related to the city or its culture. Portland has “Bridgetown” and “Stumptown.” When London followed this model, they were “Bubble” and “Squeak.”
3. A city with multiple sets of GC and multiple locations. In this way, the mechanics are the same as having two separate cities, except the cities are grouped together when displayed in the UI. For instance, we have “Seattle — Central” and “Seattle — Eastside” as two separate locations.

The `cities` table has a parent_id so that cities can be associated to one another. Local GC members in the `admins` table are associated with a city (for case 1), a parent city (for case 2), or a child city (for case 3).

Event Model
-----------

The `events` table holds a history of monthly events, including date and theme.

The `event_locations` table associates a city to an event and describes a specific location (the name of the bar, its address, website, notes, etc). These will typically point to a single city (the city model case 1) or a child city (case 3, and case 2 when multiple locations are used). Occasionally, it will point to a parent city (case 2) if that month's location is large enough that two smaller locations are unnecessary.


