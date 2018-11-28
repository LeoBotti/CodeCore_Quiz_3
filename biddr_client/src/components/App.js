import React, { Component } from 'react';

import WelcomePage from "./WelcomePage";

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div className="App">
          <NavBar currentUser={currentUser} onSignOut={this.destroySession} />
          <Switch>
            <Route path="/" exact component={WelcomePage} />
            <Route
              path="/session/new"
              exact
              render={routeProps => (
                <SignInPage {...routeProps} onSignIn={this.getUser} />
              )}
            />
            <AuthRoute
              isAuth={currentUser}
              path="/auctions/new"
              exact
              component={AuctionNewPage}
            />
            <Route
              path="/auctions/:id"
              exact={true}
              component={AuctionsShowPage}
            />
            <Route path="/auctionss" exact component={AuctionsIndexPage} />
            {/*
              A <Route> element without a "path" prop will render
              for all routes. This is primarily inside of a <Switch>.
            */}
            <Route component={NotFoundPage} />
          </Switch>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;
