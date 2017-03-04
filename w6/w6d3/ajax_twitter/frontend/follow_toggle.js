const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userID = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }

  render() {
    let buttonText = '';
    if (this.followState === 'following' || this.followState === 'unfollowing') {
      this.$el.prop("disabled", true);
      buttonText = this.followState;
    } else if (this.followState === 'followed') {
      buttonText = "Unfollow!";
      this.$el.prop('disabled', false);
    } else {
      buttonText = "Follow!";
      this.$el.prop('disabled', false);
    }

    this.$el.text(buttonText);
  }

  handleClick() {
    this.$el.click((e) => {
      e.preventDefault();
      if (this.followState === 'followed') {
        this.followUser();
      }
      else {
        this.unfollowUser();
      }
    });
  }

  followUser() {
    this.followState = "unfollowing";
    this.render();
    APIUtil.followUser(this.userID)
      .then(res => {
        this.followState = "unfollowed";
        this.render();
      });
  }

  unfollowUser() {
    this.followState = "following";
    this.render();
    APIUtil.unfollowUser(this.userID)
      .then(res => {
        this.followState = "followed";
        this.render();
      });
  }

}

module.exports = FollowToggle;
