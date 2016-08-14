
$(document).ready(function() {
  $('.summernote').summernote({
    height: 200,
    styleWithSpan: false,
    toolbar: [
    //[groupname, [button list]]
     
      ['style', ['style']],
      ['font', ['bold', 'italic', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['insert', ['link', 'hr']],
      ['action', ['undo', 'redo']],
      ['misc', ['codeview', 'fullscreen']]
    ]
  });
});