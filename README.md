# vib-banks
Fleeca bank heist resource

# DEPENDENCIES

- QBCore
- ox_lib
- ox_inventory
- ox_target
- boii_minigames

# What does resource provide?

- Ability to rob Fleecas lock boxing within the vaults, using a simple hack at a secuirty panel
- Armed guard response to provide interaction before player police arrive
- Secuirty level upgrading of inidividual vaults, providing slower open doors and quicker closing times
- Camera access from a static location of choosing
- Configurable rewards, locations, models and more

# Why isn't there a random reward table for lockboxes?

I haven't got that far yet and wanted to release this resource to get some early feedback

# Why is there no middle table loot like other bank heist resources?

Fleeca banks are small banks, with small holdings. The table in the middle would typically be used to stand stuff on when opening your own safety deposit box NOT for storing masses of cash

# Why isn't there any cash trolleys?

It is due to be added but falls way down on the list of things to do

# Why aren't you using [marked_bills] for your currency of dirty money?

Whilst this resource is free and we'd love to see it on every server out there, before anything else we've designed it for OUR server specifically and with it being open source, you're free and encouraged to make changes!

# Why does your repo have random looking pushes

That's because I'm also using this repo on a live server that is ever evolving and changing. Don't take my constant changes if you don't want them ;)

# DRILLING MINIGAME REQUIREMENTS

https://github.com/meta-hub/fivem-drilling?tab=readme-ov-file

https://github.com/meta-hub/meta_libs/releases

Both of these are required for the mini game to work - If you'd rather stick with the progressbar then uncomment the progress bar code block from the client/client file and re-comment out the drilling block

# HACKING MINIGAMES REQUIREMENT

https://github.com/boiidevelopment/boii_minigames?tab=GPL-3.0-1-ov-file