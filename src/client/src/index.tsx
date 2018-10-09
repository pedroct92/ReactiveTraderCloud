import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

// Side-effecting import for rt-theme/globals
import 'rt-theme'

// import { MainRoute, NotificationRoute, OrderTicketRoute, SimpleLauncher, StyleguideRoute } from './routes'
import { OrderTicketRoute } from './routes/OrderTicketRoute'
import { StyleguideRoute } from './routes/StyleguideRoute'

ReactDOM.render(
  <BrowserRouter>
    <Switch>
      {/* <Route path="/launcher" component={SimpleLauncher} /> */}
      <Route path="/styleguide" component={StyleguideRoute} />
      <Route path="/order-ticket" component={OrderTicketRoute} />
      <Route path="/" component={OrderTicketRoute} />
    </Switch>
  </BrowserRouter>,
  document.getElementById('root'),
)
