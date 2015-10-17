<!DOCTYPE html>
<html>
<head>
  <title>K2log</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>

<h1>Listing Articles</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Maintext</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @users.each do |user| %>
      <tr>
        <td><%= user.userId %></td>
        <td><%= user.userCompany %></td>
        <td><%= user.userDiscountRate %></td>
        <td><%= link_to 'Show', user %></td>
        <td><%= link_to 'Edit', edit_article_path(user) %></td>
        <td><%= link_to 'Destroy', user, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Article', new_article_path %>


</body>
</html>
