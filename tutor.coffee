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
    content = b.html()
    b.html(a.html())
    a.html(content)

  rearrangeQwertyToDvorak : (keys) ->
    #for from, to of @dvorakMap
      #if(keys[from] && keys[to])
      #this.swap(keys[from], keys[to]) 
  start : ($canvas) ->
    canvas = $canvas[0]
    #$(window).resize(
    canvas.width=$canvas.width()
    canvas.height=$canvas.height()
    context = canvas.getContext('2d')
    x = 150
    y = 100
 
    context.font = "40pt Calibri"
    context.fillStyle = "#0000ff"
    context.fillText("Hello World!", x, y)
