const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");
const TweetCompose = require("./tweet_compose.js");

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
