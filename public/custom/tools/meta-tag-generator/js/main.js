$(function(){

	$(".select-code").click(function(e){
		e.preventDefault();
		$(".output").selectText();
	});

	$(".help").click(function(e){
		e.preventDefault();
		$(this).find(".tooltip").addClass("init");

	});
	$(".close-tooltip").click(function(e){
		e.preventDefault();
		$(this).parent().css("display", "none");
	});

	$(".output-outer").draggable({
		handle: ".output-head",
		containment: "body"
	});

	setInterval(function(){

		// Bit of generic data to test if saved data exists on page load
		localStorage.setItem("flag", "set");

		// serializeArray is awesome and powerful
		var data = $(".meta-info").serializeArray();

		// iterate over results
		$.each(data, function(i, obj) {
			localStorage.setItem(obj.name, obj.value);
		});

	}, 5000);

	// Test if there is already saved data
	if (localStorage.getItem("flag") == "set") {

		// Same iteration stuff as before
		var data = $(".meta-info").serializeArray();

		// Only the only way we can select is by the name attribute, but jQuery is down with that.
		$.each(data, function(i, obj) {
			$("[name='" + obj.name +"']").val(localStorage.getItem(obj.name));
		});

	}

	// Provide mechanism to remove data. You'd probably actually remove it not just kill the flag
	$("#clearData").click(function(e) {

		e.preventDefault();

		localStorage.setItem("flag", "");

	});

	var $output   = $(".output-outer"),
        $window    = $(window),
        offset     = $("#body").offset(),
        formBlock = $(".form-wrap").offset(),
        topPadding = 15;


	    $window.scroll(function() {
	    	if ($output.css("width") == "550px"){
		        if ($window.scrollTop() > offset.top) {
		            $output
			            .stop().animate({
			                top: "40px"
			            })
			            .css("position", "fixed");
		        }
		        else {
		            $output
			            .stop().animate({
			                top: "0px"
			            })
			            .css("position", "static");
		        }
		    }
	    });

	new dataInsert();

});


	var dataInsert = function(){
		self = this;
		self.formInput = $(".meta-info");
		self.output = $(".meta-output");
		self.init();
	}

	dataInsert.prototype = {

		init: function(){
			self.scrape();
			self.countChar();

			self.formInput.each(function(i, index){
				$(index)
					.on("change", self.scrape)
					.on("keyup", self.scrape);
				$(index)
					.on("change", self.countChar)
					.on("keyup", self.countChar);
				// self.formInput
				// 	.on("change", self.preview)
				// 	.on("keyup", self.preview);
			});

		}

		, scrape: function(){

			compiledStrings = {

				page_type: self.formInput.find("[name=page_type]").val(),

				web_url: self.formInput.find("[name=web_url]").val(),

				meta_page_title : self.formInput.find("[name=meta_page_title]").val(),
				meta_web_name : self.formInput.find("[name=meta_web_name]").val(),
				meta_web_desc : self.formInput.find("[name=meta_web_desc]").val(),

				og_title : self.formInput.find("[name=meta_page_title]").val(),
				og_image : self.formInput.find("[name=og_image]").val(),
				og_desc : self.formInput.find("[name=meta_web_desc]").val(),

				twitter_site: self.formInput.find("[name=twitter_site]").val(),
				twitter_creator: self.formInput.find("[name=twitter_creator]").val(),

				google_author: self.formInput.find("[name=google_author]").val(),
				google_publisher: self.formInput.find("[name=google_publisher]").val(),

			}

			self.insert(compiledStrings);
			// self.preview(compiledStrings);

		}

		,  insert: function(inputs){

			strings = $.extend({}, inputs);


				$(".__base")
					.text(
						"<!-- Add to html tag -->\n" +
						"<html itemscope itemtype=\"http://schema.org/" + strings.page_type + "\">\n\n" +
				 		//asd
				 		"<!-- Basic meta info -->\n" +
						"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" +
						"<meta name=\"name\" content=\"" + self.convertHTML(strings.meta_web_name) + "\" />\n" +
						"<meta name=\"description\" content=\"" + self.convertHTML(strings.meta_web_desc) + "\" />\n\n" +

						"<!-- Page title -->\n" +
						"<title>" + self.convertHTML(strings.meta_page_title) + "</title>\n\n" +


						"<!-- G+ Open Graph -->\n" +
						"<meta property=\"og:title\" content=\"" + self.convertHTML(strings.og_title) + "\" />\n" +
						"<meta property=\"og:image\" content=\"" + self.convertHTML(strings.og_image) + "\" />\n" +
						"<meta property=\"og:description\" content=\"" + self.convertHTML(strings.og_desc) + "\" />\n"
					);

				if ($("[name=toggle_twitter]").is(':checked')){
					$("#twitter-data").attr("class", "active");
					$(".__twitter").text(
					"<!-- Twitter card -->\n" +
					"<meta name=\"twitter:url\" content=\"" + strings.web_url + "\"/>\n" +
					"<meta name=\"twitter:card\" content=\"summary\" />\n" +
					"<meta name=\"twitter:site\" content=\"" + strings.twitter_site + "\" />\n" +
					"<meta name=\"twitter:creator\" content=\"" + strings.twitter_creator + "\" />\n" +
					"<meta name=\"twitter:title\" content=\"" + self.convertHTML(strings.meta_page_title) + "\" />\n" +
					"<meta name=\"twitter:description\" content=\"" + self.convertHTML(strings.meta_web_desc) + "\" />\n" +
					"<meta name=\"twitter:image\" content=\"" + strings.og_image + "\" />\n"
					);
				}
				else{
					$("#twitter-data").attr("class", "inactive");
					$(".__twitter").text("");
				}

				if ($("[name=toggle_google]").is(':checked')){
					$("#google-plus-data").attr("class", "active");
					$(".__google").text(
					"<!-- G+ author & publisher -->\n" +
					"<link rel=\"author\" href=\"" + strings.google_author + "\"/>\n" +
					"<link rel=\"publisher\" href=\"" + strings.google_publisher + "\"/>\n"
					);
				}
				else{
					$("#google-plus-data").attr("class", "inactive");
					$(".__google").text("");
				}


				if ($("[name=toggle_dns]").is(':checked')){
					$(".__dns").text(
					"<!-- Basic External Assets DNS Prefetch -->\n" +
					"<link rel=\"dns-prefetch\" href=\"//fonts.googleapis.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//www.google-analytics.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//platform.twitter.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//p.twitter.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//cdn.api.twitter.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//s3.amazonaws.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//graph.facebook.com\">\n" +
					"<link rel=\"dns-prefetch\" href=\"//connect.facebook.net\">\n"
					);
				}
				else{
					$(".__dns").text("");
				}

				if ($("[name=toggle_jquery]").is(':checked')){
					$(".__jquery").text(
					"<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js\"></script>"
					);
				}
				else{
					$(".__jquery").text("");
				}


				if ($("[name=toggle_mobile]").is(':checked')){
					$(".__mobile").text(
						"<!-- Mobile browser viewport -->\n" +
						"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">"
					);
				}
				else{
					$(".__mobile").text("");
				}

		}

		, countChar: function() {

			$(".meta-info input[type=text], .meta-info textarea").each(function(key, value){
				if ($(value).data()){
					var len = $(value).val().length;
					var limit = $(value).data("limit");
					var output = $(value).parent("div").find(".limit");

					var remChars = limit - len;

					if (len >= limit-20 && len < limit){
						$(output).addClass("low");
					}
					else if(len >= limit){
						$(output).addClass("out");
					}
					else{
						$(output).removeClass("low");
						$(output).removeClass("out");
					}

					output.html(remChars);

				}

			});

		}

		// , preview: function(){

		// 	self.formInput.each(function(i, index){

		// 		var preview = $(index).data("preview");
		// 		var output = $("." + preview + "-preview");
		// 			output.addClass("active");

		// 		output.find(".preview-title").html(strings.meta_page_title);
		// 		output.find(".preview-desc").html(strings.meta_web_desc);

		// 		if (strings.meta_page_title == ""){
		// 			strings.meta_page_title = "Enter Your Page Title";
		// 		}
		// 		if (strings.og_image == "http://" || strings.og_image == ""){
		// 			output
		// 				.find(".preview-img")
		// 					.removeClass("active")
		// 					.addClass("off");
		// 		}
		// 		else{
		// 			output
		// 				.find(".preview-img")
		// 				.removeClass("off")
		// 				.addClass("active")
		// 				.attr("src", strings.og_image);
		// 		}
		// 	});

		// }

		, convertHTML: function(value){
			return $('<div/>').text(value).html();
		}


	}



jQuery.fn.selectText = function(){
    var doc = document
        , element = this[0]
        , range, selection
    ;
    if (doc.body.createTextRange) {
        range = document.body.createTextRange();
        range.moveToElementText(element);
        range.select();
    } else if (window.getSelection) {
        selection = window.getSelection();
        range = document.createRange();
        range.selectNodeContents(element);
        selection.removeAllRanges();
        selection.addRange(range);
    }
};


