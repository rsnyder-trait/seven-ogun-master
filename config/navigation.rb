SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :home, 'Home', '/'
    primary.item :about, 'About', '/about', :highlights_on => /\/about/
    primary.item :solutions, 'Solutions', '/solutions/coating-solutions', :highlights_on => /\/solutions/, :class => 'subnav' do |solutions|
#      solutions.item :card_solutions, 'Card Solutions', '/solutions/card-solutions'
      solutions.item :coating_solutions, 'Coating Solutions', '/solutions/coating-solutions'
      solutions.item :container_solutions, 'Container Solutions', '/solutions/container-solutions'
#      solutions.item :equipment, 'Equipment', '/solutions/equipment'
#      solutions.item :inkjet_solutions, 'Inkjet Solutions', '/solutions/inkjet-solutions'
#      solutions.item :rfid, 'RFID', '/solutions/rfid'
    end
#    primary.item :clients, 'Clients &amp; Partners', '/clients-and-partners/wfb', :highlights_on => /\/clients-and-partners/, :class => 'subnav' do |clients|
#      clients.item :ashworth, 'Ashworth', '/clients-and-partners/ashworth'
#      clients.item :graphtech, 'Graphtech', '/clients-and-partners/graphtech'
#      clients.item :heights, 'Heights', '/clients-and-partners/heights'
#      clients.item :wfb, 'PTS', '/clients-and-partners/pts'
#     clients.item :real_smart, 'RealSmart', '/clients-and-partners/real_smart'
#      clients.item :trelleborg, 'Trelleborg', '/clients-and-partners/trelleborg'
#      clients.item :wfb, 'WFB', '/clients-and-partners/wfb'
#    end
    primary.item :contact, 'Contact', '/contact'
  end
end
