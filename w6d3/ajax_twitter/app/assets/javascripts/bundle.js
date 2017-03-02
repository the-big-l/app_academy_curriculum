/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	const UsersSearch = __webpack_require__(3);
	const TweetCompose = __webpack_require__(4);
	
	$(() => {
	  $('nav').each ( (_, element) => {
	    const myEl = new UsersSearch(element);
	  });
	
	  $('button.follow-toggle').each ( (_, element) => {
	    const myEl = new FollowToggle(element);
	  });
	
	
	  if ($('div.show-page-div')[0]) {
	    new TweetCompose($('div.show-page-div'));
	  }
	  // });
	
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
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


/***/ },
/* 2 */
/***/ function(module, exports) {

	class APIUtil {
	  followUser(id) {
	    return $.ajax({
	      url: `/users/${id}/follow`,
	      method: 'DELETE',
	      dataType: 'json'
	    });
	  }
	
	  unfollowUser(id) {
	    return $.ajax({
	      url: `/users/${id}/follow`,
	      method: 'POST',
	      dataType: 'json'
	    });
	  }
	
	  searchUsers(queryVal, success) {
	    return $.ajax({
	      url: "/users/search",
	      method: 'GET',
	      dataType: 'json',
	      data: {query: queryVal}
	    });
	  }
	
	  createTweet(data) {
	    return $.ajax({
	      url: "/tweets",
	      method: "POST",
	      dataType: 'json',
	      data: data
	    });
	  }
	}
	
	module.exports = new APIUtil();


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	const FollowToggle = __webpack_require__(1);
	
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


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
	
	class TweetCompose {
	  constructor(body) {
	    this.$form = $(body).find("form.tweet-compose");
	    this.$submitButton = this.$form.find(':submit');
	    this.$content = this.$form.find('textarea');
	    this.$ul = $(body).find("#feed");
	    this.$counter = this.$form.find('.chars-left');
	    this.submitClick();
	    this.countChars();
	  }
	
	  countChars() {
	    window.setInterval(e => {
	      let len = 140 - this.$content.val().length;
	      this.$counter.text(len);
	    }, 250);
	  }
	
	  submitClick() {
	    this.$submitButton.click((e) => {
	      e.preventDefault();
	
	      this.submit();
	      this.disableForm();
	    });
	  }
	
	  disableForm() {
	    this.$form.find(":input").prop("disabled", true);
	  }
	
	  submit() {
	    const data = this.$form.serialize();
	
	    APIUtil.createTweet(data)
	      .then(res => this.handleSuccess(res));
	  }
	
	  render(res) {
	    const content = res.content;
	    const author = res.user.username;
	    const date = res.created_at;
	    const text = [content, author, date].join(' -- ');
	    const $li = $('<li>').text(text);
	    this.$ul.prepend($li);
	  }
	
	  clearInput() {
	    this.$form.find('textarea').val('');
	    this.$counter.text(140);
	  }
	
	  handleSuccess(res) {
	    this.render(res);
	    this.clearInput();
	    this.$form.find(":input").prop("disabled", false);
	  }
	}
	
	module.exports = TweetCompose;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map