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

  # this is less straightforward than initially thought
  rearrangeQwertyToDvorak : (keys) ->
    for from, to of @dvorakMap
      if(keys[from] && keys[to])
        console.log("Swapping " + from + " to " + to);
        #this.swap(keys[from], keys[to])

  start : ($canvas) ->
    self = this
    canvas = $canvas[0]
    resize = ->
      canvas.width=$canvas.width()
      canvas.height=$canvas.height()
      self.redraw(canvas)
    $(window).resize(resize)
    resize()

  redraw : (canvas) ->
    context = canvas.getContext('2d')
    x = 150
    y = 100

    context.font = "40pt Calibri"
    context.fillStyle = "#0000ff"
    context.fillText("Hello World!", x, y)
