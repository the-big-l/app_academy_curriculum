const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = this.$el.find('input').val();
    this.$input = $(this.$el.find('input')[0]);
    this.$ul = this.$el.find('ul');
    this.handleInput();
    console.log(this.$input);
  }

  handleInput() {
    this.$input.on('input', e => {
      e.preventDefault();

      APIUtil.searchUsers(this.$el.find('input').val())
        .then(res => this.renderResults(res));
    });
  }

  renderResults(res) {
    this.$ul.empty();

    res.forEach(user => {
      this.$ul.append(`<li><a href="/users/${user.id}">${user.username}</a></li>`);
      const $followButton = $('<button>');
      $followButton.attr('data-user-id', user.id);
      let followStatus = '';
      if (user.followed) {
        followStatus = "followed";
      }
      else {
        followStatus = "unfollowed";
      }
      $followButton.attr('data-initial-follow-state', followStatus);
      $followButton.addClass('follow-toggle');
      this.$ul.append($followButton);
      new FollowToggle($($followButton));
    });
  }

}

module.exports = UsersSearch;
