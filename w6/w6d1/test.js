$(() => {
  const $green = $( ".green" );
  const $red = $( ".red" );
  const $li = $("li");
  const $ul = $("ul");
  const $title = $("title");
  const $coolInput = $("cool-input");
  const coolThings = [
    "racecars",
    "lasers",
    "aeroplanes"
  ];

  window.setInterval( () => {
    const $coolInput = $("#cool-input");

    if ($coolInput.val() == "racecars") {
      // Reset the input on them!
      $coolInput.val("lasers");
    }
  }, 100);

  window.setTimeout(() => {

    $green.each(function() {
      this.className = "red";
    });

    $red.each(function() {
      this.className = "green";
    });

    window.setTimeout(() => {
      $ul.children().attr("style", "background-color: purple");

      window.setTimeout(() => {
        $ul.parent().attr("style", "background-color: thistle");

        window.setTimeout(() => {
          $ul.siblings().attr("style", "background-color: white");

          let i = 0;
          window.setInterval( () => {
            const $ul = $("ul");
            if ($ul.children().length == 10) {
              // $ul.children() returns a jQuery object containing all the
              // children; we then call `#remove`, which implicitly iterates
              // over the set, removing each of them.
              $ul.children().remove();
            }

            const $li = $("<li></li>");
            $li.text(coolThings[i]);
            // jQuery#append is just like HTMLElement#appendChild
            $ul.append($li);
            $title.text(coolThings[i]);

            i = (i + 1) % 3;
          }, 1000);
        }, 1000);
      }, 1000);
    }, 1000);
  }, 1000);

});
