# Commenter Session State

Commenter Session State is developer plugin for Movable Type that adds a callback enabling plugins to modify the user session state data that gets sent via JSONP during a commenter login.

## Background

While MT has many callback hooks, it is lacking in this area when it comes to logins: there are few, if any, callbacks that plugins can hook into during login operations.  This plugin provides a new callback for commenter (front-end) logins.  The 'commenter_session_state' callback is trigger not during the authentication itself, but rather during the client-side JSONP call to the 'session_js' method of the comments script.  As such, it does not enable you affect the success/failure of the auth process, but rather enables you to take action after a successful login has occurred.  Specifically, the callback is ideally suited to the adding to or modify the session state data that returns via JSONP, which can then be stored in a cookie, etc.

The callback function is passed 4 parameters:
* $cb
* $app
* $c (session state hash)
* $commenter (MT Author object)
