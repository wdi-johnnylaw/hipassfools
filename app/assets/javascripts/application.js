// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.tagsinput
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });


$(function() {
   $('input.tags').tagsInput({
      autocomplete_url: '/tags.json',
      height: 'auto',
      width: 'auto',
      onRemoveTag: function(tag) {
         $(this).addTag(tag);
      },
      onAddTag: function(tag) {
         if(window.currentUser) {
            $.ajax({
               url: '/taggings.json',
               type: 'post',
               data: {
                  tagging: {
                     tag_name: tag,
                     message_id: $(this).prop('id').replace(/^msg/, '')
                  }
               }
            });
         }
      }
   });
});

$(document).on('click', 'span.tag span', function() {
    var tag = $(this).html().replace(/&nbsp;/g, '');
    window.location.href = '/tags/' + tag;
});

$('#search').autocomplete({ source: "/tags" });