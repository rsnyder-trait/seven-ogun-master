SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :home, 'Home', '/'
    primary.item :about, 'About', '/about', :highlights_on => /\/about/
    primary.item :solutions, 'Solutions', '/solutions/coating-solutions', :highlights_on => /\/solutions/, :class => 'subnav' do |solutions|
      solutions.item :coating_solutions, 'Coating Solutions', '/solutions/coating-solutions'
      solutions.item :container_solutions, 'Container Solutions', '/solutions/container-solutions'
    end
    primary.item :contact, 'Contact', '/contact'
  end
end
