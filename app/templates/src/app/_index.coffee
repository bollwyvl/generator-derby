derby = require 'derby'

app = module.exports = derby.createApp 'app', __filename

global.app = app unless derby.util.isProduction

<% if (includeJade) { %>
app.serverUse module, 'derby-jade'<% } %><% if (includeStylus) { %>
app.serverUse module, 'derby-stylus'<% } %>

app.loadViews __dirname + '/../../views/app'
app.loadStyles __dirname + '/../../styles/app'

app.get '/', (page) ->
  page.render 'home'