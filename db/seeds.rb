# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.create(
  [
    {
      title: 'Hey doa',
      text: 'Lorem ipsum'
    },
    {
      title: 'Hey',
      text: 'Lorem ipsum'
    },
    {
      title: 'new article because yes',
      text: %(
        Robust flavour, spoon sit pumpkin spice in extra foam
        steamed. Breve filter seasonal café au lait turkish
        espresso, café au lait redeye caramelization medium
        whipped pumpkin spice. Turkish, french press ut, organic
        espresso chicory robust flavour. Ut irish con panna
        variety arabica medium frappuccino in medium white.
        Saucer body caramelization percolator extra a irish
        grinder pumpkin spice. Trifecta chicory, blue mountain
        doppio roast steamed cup skinny single shot espresso.
        Con panna aged con panna cream a redeye cream. Est,
        espresso arabica single origin id et, sit eu sweet eu
        that decaffeinated.
      )
    }
  ]
)

Comment.create(
  [
    {
      commenter: 'A name',
      body: %(
        Spit up on light gray carpet instead of adjacent
        linoleum stand in front of the computer screen, or jump
        launch to pounce upon little yarn mouse, bare fangs at
        toy run hide in litter box until treats are fed yet run
        outside as soon as door open or caticus cuteicus hide
        when guests come over. Sit on the laptop lick sellotape
        purr for no reason burrow under covers. My left donut is
        missing, as is my right paw at beetle and eat it before
        it gets away yet run outside as soon as door open. Sit
        on the laptop i like big cats and i can not lie howl
        uncontrollably for no reason mark territory. Meowwww.
        Eat from dogs food. Russian blue walk on car leaving
        trail of paw prints on hood and windshield. Play
        riveting piece on synthesizer keyboard stare at ceiling
        wake up human for food at 4am, destroy couch as revenge,
        stare out the window.
      )
    }
  ]
)
