var Searches = {
  els: {
    authentication: '.authenticate',
    signupButton: 'a#signup',
    loginButton: 'a#login',
    signupForm: 'form#signup',
    loginForm: 'form#login'
  },

  bindEvents: function() {
    var self = this;
    $(this.els.authentication).on('ajax:success', this.els.loginButton, function(e, data) { self.appendLogin(data); });
    $(this.els.authentication).on('ajax:success', this.els.signupButton, function(e, data) { self.appendSignup(data); });
    $(this.els.authentication).on('ajax:success', this.els.signupForm, function(e, data) { self.appendUserinfo(data); });
    $(this.els.authentication).on('ajax:success', this.els.loginForm, function(e, data) { self.appendUserinfo(data); });
  },

  appendLogin: function(data) {
    this.clearButtons();
    $(this.els.authentication).append(data);
  },

  appendSignup: function(data) {
    this.clearButtons();
    $(this.els.authentication).append(data);
  },

  clearButtons: function() {
    $(this.els.signupButton).remove();
    $(this.els.loginButton).remove();
  },

  clearForms: function() {
    $(this.els.signupForm).remove();
    $(this.els.loginForm).remove();
  },

  appendUserinfo: function(data) {
    this.clearForms();
    $(this.els.authentication).append(data);
  }
};

$(document).ready(function() {
  Searches.bindEvents();
});
