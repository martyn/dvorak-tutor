/* On a QWERTY system, change all text boxes to use the Dvorak layout. */

(function ($, textUtils) {
    var converter = {'"':'_',"'":'-','+':'}','-':'[',',':'w','/':'z','.':'v',';':'s',':':'S','=':']','<':'W','?':'Z','>':'V','C':'J','B':'X','E':'>','D':'E','G':'I','F':'U','I':'C','H':'D','K':'T','J':'H','L':'N','O':'R','N':'B','Q':'"','P':'L','S':'O','R':'P','U':'G','T':'Y','W':'<','V':'K','Y':'F','X':'Q','[':'/','Z':':',']':'=','_':'{','c':'j','b':'x','e':'.','d':'e','g':'i','f':'u','i':'c','h':'d','k':'t','j':'h','l':'n','o':'r','n':'b','q':"'",'p':'l','s':'o','r':'p','u':'g','t':'y','w':',','v':'k','y':'f','x':'q','{':'?','z':';','}':'+'};
    // Match:
    // text, password, and untyped inputs (input is text by default)
    // textareas
    $("input[type='text'], input[type='password'], input:not(input[type]), textarea").keypress(function(evt) {
        if (evt.which != 8 && !evt.ctrlKey && !evt.altKey && !evt.metaKey) {
            evt.preventDefault();

            var $this = $(this);

            var s = textUtils.getSelectionStart(this);
            var e = textUtils.getSelectionEnd(this);
            var allText = $this.val();

            var oldChar = String.fromCharCode(evt.which);
            var newChar = converter[oldChar] ? converter[oldChar] : oldChar;

            $this.val(allText.substring(0, s) + newChar + allText.substring(e));
            $this.selectRange(s + 1, s + 1);
        }
    });
}(jQuery, textUtils));
