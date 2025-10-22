import { Controller } from "@hotwired/stimulus";
import { marked } from "marked";

// Connects to data-controller="markdown"
export default class extends Controller {
  //// NOTE: if you want to do something like this, be sure to include target in the rails helper:
  //// <%= form.text_area :attributeName, data: { controller: "markdown", markdown_target: "textarea" } %>
  //static targets = ["textarea"];

  connect() {
    // If already initialized, do nothing (used to add $editor.data("markdown-initialized", true) before this was a class element)
    if (this.$editor) return;

    // this retains the textarea and places the div after (note: requires copy content before submit)
    // A necessary hack to patch unexpected behavior from markdown editor
    //const $textarea = $(this.textareaTarget);
    this.$textarea = $(this.element);
    const $div = $("<div>");
    $div.html(this.$textarea.html());
    this.$textarea.after($div);
    this.$textarea.hide();

    this.$editor = $div;

    this.$editor.markdownEditor({
      height: '300px',
      theme: 'tomorrow',
      mode: 'markdown',
      enableBasicAutocompletion: true,
      enableLiveAutocompletion: true,
      preview: true,
      onPreview: function (content, callback) {
        callback(marked.parse(content));
      },
    });
  }

  /**
   * Public method: sync editor content back to textarea
   */
  sync() {
    const editorContent = this.$editor.markdownEditor('content');
    // this.textareaTarget.value = editorContent;
    this.$textarea.val(editorContent);
  }
}
