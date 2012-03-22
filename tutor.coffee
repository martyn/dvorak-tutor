class Tutor
  constructor : () ->
    @dvorakMap = {
      '"':'_',
      "'":'-',
      '+':'}',
      '-':'[',
      ',':'w',
      '/':'z',
      '.':'v',
      ';':'s',
      ':':'S',
      '=':']',
      '<':'W',
      '?':'Z',
      '>':'V',
      'C':'J',
      'B':'X',
      'E':'>',
      'D':'E',
      'G':'I',
      'F':'U',
      'I':'C',
      'H':'D',
      'K':'T',
      'J':'H',
      'L':'N',
      'O':'R',
      'N':'B',
      'Q':'"',
      'P':'L',
      'S':'O',
      'R':'P',
      'U':'G',
      'T':'Y',
      'W':'<',
      'V':'K',
      'Y':'F',
      'X':'Q',
      '[':'/',
      'Z':':',
      ']':'=',
      '_':'{',
      'c':'j',
      'b':'x',
      'e':'.',
      'd':'e',
      'g':'i',
      'f':'u',
      'i':'c',
      'h':'d',
      'k':'t',
      'j':'h',
      'l':'n',
      'o':'r',
      'n':'b',
      'q':"'",
      'p':'l',
      's':'o',
      'r':'p',
      'u':'g',
      't':'y',
      'w':',',
      'v':'k',
      'y':'f',
      'x':'q',
      '{':'?',
      'z':';',
      '}':'+'
    }

  swap : (a, b) ->
    if(a.data('swapped')) 
      return
    
    if(b.data('swapped')) 
      return
    
    a.data('swapped', true)
    b.data('swapped', true)
    a.css('background-color', 'red')
    b.css('background-color', 'blue')
    debugger
    parent = a.parent()
    marker = $("<div id='marker' style='width: 20px; height: 20px; background-color: yellow;'/>")
    marker.insertBefore(b)
    b.insertAfter(a)
    a.insertAfter(marker)
    marker.remove()

  start: () ->
    $("#main").html("<div class='keywords'></div>")
    this.addWord(i) for i in [0...10]

  addWord: (index) ->
    word = $("<div id='word"+index+"' class='keyword' data-oncomplete='tutor.wordDone("+index+");'><span class='finished'></span><span class='unfinished'>Word</span></div>")
    $(".keywords").append(word)
    word.css("top", Math.floor(index/5)*50)
    word.css("left", (index%5)*100)
  

  wordDone : (index) ->
    $("#word"+index).addClass("demolish")
    console.log("word done: " + index)

  # this is less straightforward than initially thought
  rearrangeQwertyToDvorak : (keys) ->
    for from, to of @dvorakMap
      if(keys[from] && keys[to])
        console.log("Swapping " + from + " to " + to);
        #this.swap(keys[from], keys[to])

  charPressed: (char) ->
    awaiting = $(".keyword")
    awaiting.each( (i, keyword) -> 
      unfinished = $(keyword).find('.unfinished')
      finished = $(keyword).find('.finished')

      if(char.toUpperCase() != unfinished.html()[0].toUpperCase())
        return

      finished.html(finished.html() + unfinished.html()[0])
      unfinished.html(unfinished.html()[1..-1])

      if(unfinished.text() == "")
        eval($(keyword).attr('data-oncomplete'))
        $(keyword).addClass('.dieing')
        $(keyword).removeClass('.keyword')
      )
    
