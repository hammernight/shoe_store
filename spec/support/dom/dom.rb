require 'domino'
module Dom
  class Order < Domino
    selector 'select#release_month'
    attribute :month_name, 'option[@value]'

  end

  class Home < Domino
    selector 'form'
    attribute :shoe_search
    attribute :form_heading
    attribute :month_select

  end
end

=begin
<!doctype html>
<html>
  <head>
    <title>Domino Rspec</title>
  </head>
  <body>
    <h1>Domino Rspec</h1>
    <ul>
      <li><span class='name'>John Doe</span> Age <span class='age'>47</span></li>
      <li><span class='name'>Jane Doe</span> Age <span class='age'>37</span></li>
      <li><span class='name'>Jim Doe</span> Age <span class='age'>27</span></li>
    </ul>
  </body>
</html>

module Dom
  class Person < Domino
    selector 'ul li'
    attribute :name
    attribute :age
  end
end
=end