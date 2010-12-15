require File.expand_path(File.dirname(__FILE__)+"/spec_helper.rb")
describe Rubyvis::Layout::Horizon do
  it "should have correct properties" do
    props=[:antialias, :background_style, :bands,  :bottom, :canvas, :cursor, :data, :events, :fill_style, :height, :id, :left, :line_width, :mode, :negative_style, :overflow, :positive_style, :reverse, :right, :stroke_style, :title, :top, :transform, :visible, :width].inject({}) {|ac, v| ac[v]=true; ac}
    Rubyvis::Layout::Horizon.properties.should==props 
  end
  describe "rendered" do
    before do
      @data = Rubyvis.range(-5, 5, 0.1).map {|d|
        OpenStruct.new({:x=> d ,  :y=> d**2-10});
      }
      
      
      
      w = 400
      h = 100
      x = Rubyvis::Scale.linear(@data, lambda {|d| d.x}).range(0, w)
      y = Rubyvis::Scale.linear(@data, lambda {|d| d.y}).range(-50, h*2);
      
      #/* The root panel. */
      @vis = pv.Panel.new()
      .width(w)
      .height(h*2+20)
      .bottom(20)
      .left(20)
      .right(10)
      .top(5)

      
      
      @pan = @vis.add(Rubyvis::Panel).
      height(80).
      top(30)  
      
      @pan.add(Rubyvis::Layout::Horizon)
       .bands(3)
      .band.add(Rubyvis::Area)
       .data(@data)
       .left(lambda {|d| x[d.x]})
       .height(lambda {|d| y[d.y]})
      @vis.render
      
      html_out=<<EOF
<svg font-size="10px" font-family="sans-serif" fill="none" stroke="none" stroke-width="1.5" width="430" height="245"><g transform="translate(20, 5)"><g transform="translate(0, 30)"><g><g clip-path="url(#87)"><clippath id="87"><rect x="0" y="0" width="400" height="80"/>
</clippath><rect width="400" height="80" fill="rgb(255,255,255)"/><g><path d="M0,-120L4.0404040404040265,-110.10000000000005L8.080808080808087,-100.4L12.121212121212114,-90.90000000000003L16.161616161616173,-81.59999999999997L20.2020202020202,-72.5L24.242424242424228,-63.60000000000002L28.282828282828287,-54.89999999999998L32.32323232323232,-46.400000000000006L36.363636363636374,-38.099999999999994L40.4040404040404,-30L44.44444444444445,-22.099999999999994L48.48484848484849,-14.400000000000006L52.52525252525252,-6.900000000000034L56.565656565656575,0.4000000000000341L60.60606060606061,7.5L64.64646464646465,14.40000000000002L68.68686868686869,21.100000000000023L72.72727272727272,27.59999999999998L76.76767676767679,33.90000000000002L80.8080808080808,40L84.84848484848484,45.89999999999999L88.8888888888889,51.60000000000002L92.92929292929294,57.10000000000002L96.96969696969698,62.40000000000002L101.01010101010101,67.5L105.05050505050507,72.4L109.09090909090911,77.10000000000001L113.13131313131312,81.60000000000001L117.17171717171718,85.9L121.21212121212122,90L125.25252525252526,93.9L129.2929292929293,97.60000000000001L133.33333333333334,101.10000000000001L137.37373737373738,104.4L141.41414141414143,107.5L145.45454545454547,110.4L149.4949494949495,113.10000000000001L153.53535353535355,115.60000000000001L157.5757575757576,117.9L161.6161616161616,120L165.65656565656568,121.9L169.6969696969697,123.6L173.73737373737373,125.1L177.7777777777778,126.4L181.8181818181818,127.5L185.85858585858588,128.4L189.8989898989899,129.1L193.93939393939397,129.60000000000002L197.97979797979798,129.9L202.02020202020202,130L206.06060606060606,129.9L210.10101010101013,129.6L214.14141414141415,129.1L218.18181818181822,128.4L222.22222222222223,127.5L226.26262626262624,126.39999999999999L230.3030303030303,125.1L234.34343434343435,123.6L238.3838383838384,121.89999999999999L242.42424242424244,120L246.4646464646465,117.89999999999999L250.50505050505052,115.6L254.5454545454546,113.1L258.5858585858586,110.39999999999999L262.62626262626264,107.5L266.6666666666667,104.39999999999998L270.7070707070707,101.1L274.74747474747477,97.59999999999998L278.7878787878788,93.89999999999998L282.82828282828285,90L286.8686868686869,85.89999999999998L290.90909090909093,81.6L294.949494949495,77.09999999999997L298.989898989899,72.39999999999998L303.030303030303,67.5L307.0707070707071,62.39999999999998L311.11111111111114,57.099999999999994L315.1515151515152,51.599999999999966L319.1919191919192,45.89999999999998L323.2323232323232,40L327.27272727272725,33.90000000000002L331.31313131313135,27.599999999999923L335.3535353535354,21.099999999999966L339.3939393939394,14.399999999999977L343.4343434343434,7.5L347.47474747474746,0.4000000000000341L351.51515151515156,-6.900000000000091L355.5555555555556,-14.400000000000063L359.5959595959596,-22.100000000000023L363.6363636363636,-30L367.67676767676767,-38.099999999999994L371.71717171717177,-46.40000000000009L375.75757575757575,-54.90000000000006L379.7979797979798,-63.60000000000002L383.83838383838383,-72.5L387.87878787878793,-81.60000000000014L391.919191919192,-90.90000000000009L395.95959595959596,-100.40000000000006L400,-110.10000000000005L400,80L395.95959595959596,80L391.919191919192,80L387.87878787878793,80L383.83838383838383,80L379.7979797979798,80L375.75757575757575,80L371.71717171717177,80L367.67676767676767,80L363.6363636363636,80L359.5959595959596,80L355.5555555555556,80L351.51515151515156,80L347.47474747474746,80L343.4343434343434,80L339.3939393939394,80L335.3535353535354,80L331.31313131313135,80L327.27272727272725,80L323.2323232323232,80L319.1919191919192,80L315.1515151515152,80L311.11111111111114,80L307.0707070707071,80L303.030303030303,80L298.989898989899,80L294.949494949495,80L290.90909090909093,80L286.8686868686869,80L282.82828282828285,80L278.7878787878788,80L274.74747474747477,80L270.7070707070707,80L266.6666666666667,80L262.62626262626264,80L258.5858585858586,80L254.5454545454546,80L250.50505050505052,80L246.4646464646465,80L242.42424242424244,80L238.3838383838384,80L234.34343434343435,80L230.3030303030303,80L226.26262626262624,80L222.22222222222223,80L218.18181818181822,80L214.14141414141415,80L210.10101010101013,80L206.06060606060606,80L202.02020202020202,80L197.97979797979798,80L193.93939393939397,80.00000000000001L189.8989898989899,80L185.85858585858588,80L181.8181818181818,80L177.7777777777778,80L173.73737373737373,80L169.6969696969697,80L165.65656565656568,80L161.6161616161616,80L157.5757575757576,80L153.53535353535355,80L149.4949494949495,80L145.45454545454547,80L141.41414141414143,80L137.37373737373738,80L133.33333333333334,80L129.2929292929293,80L125.25252525252526,80L121.21212121212122,80L117.17171717171718,80L113.13131313131312,80L109.09090909090911,80L105.05050505050507,80L101.01010101010101,80L96.96969696969698,80L92.92929292929294,80L88.8888888888889,80L84.84848484848484,80L80.8080808080808,80L76.76767676767679,80L72.72727272727272,80L68.68686868686869,80L64.64646464646465,80L60.60606060606061,80L56.565656565656575,80L52.52525252525252,80L48.48484848484849,80L44.44444444444445,80L40.4040404040404,80L36.363636363636374,80L32.32323232323232,80L28.282828282828287,80L24.242424242424228,80L20.2020202020202,80L16.161616161616173,80L12.121212121212114,80L8.080808080808087,80L4.0404040404040265,80L0,80Z" fill="rgb(180,210,230)"/>
</g>
</g><g clip-path="url(#88)"><clippath id="88"><rect x="0" y="0" width="400" height="80"/>
</clippath><g><path d="M0,-200L4.0404040404040265,-190.10000000000005L8.080808080808087,-180.4L12.121212121212114,-170.90000000000003L16.161616161616173,-161.59999999999997L20.2020202020202,-152.5L24.242424242424228,-143.60000000000002L28.282828282828287,-134.89999999999998L32.32323232323232,-126.4L36.363636363636374,-118.1L40.4040404040404,-110L44.44444444444445,-102.1L48.48484848484849,-94.4L52.52525252525252,-86.90000000000003L56.565656565656575,-79.59999999999997L60.60606060606061,-72.5L64.64646464646465,-65.59999999999998L68.68686868686869,-58.89999999999998L72.72727272727272,-52.40000000000002L76.76767676767679,-46.09999999999998L80.8080808080808,-40L84.84848484848484,-34.10000000000001L88.8888888888889,-28.399999999999977L92.92929292929294,-22.899999999999977L96.96969696969698,-17.59999999999998L101.01010101010101,-12.5L105.05050505050507,-7.599999999999994L109.09090909090911,-2.8999999999999915L113.13131313131312,1.6000000000000085L117.17171717171718,5.900000000000006L121.21212121212122,10L125.25252525252526,13.900000000000006L129.2929292929293,17.60000000000001L133.33333333333334,21.10000000000001L137.37373737373738,24.400000000000006L141.41414141414143,27.5L145.45454545454547,30.400000000000006L149.4949494949495,33.10000000000001L153.53535353535355,35.60000000000001L157.5757575757576,37.900000000000006L161.6161616161616,40L165.65656565656568,41.900000000000006L169.6969696969697,43.599999999999994L173.73737373737373,45.099999999999994L177.7777777777778,46.400000000000006L181.8181818181818,47.5L185.85858585858588,48.400000000000006L189.8989898989899,49.099999999999994L193.93939393939397,49.60000000000002L197.97979797979798,49.900000000000006L202.02020202020202,50L206.06060606060606,49.900000000000006L210.10101010101013,49.599999999999994L214.14141414141415,49.099999999999994L218.18181818181822,48.400000000000006L222.22222222222223,47.5L226.26262626262624,46.39999999999999L230.3030303030303,45.099999999999994L234.34343434343435,43.599999999999994L238.3838383838384,41.89999999999999L242.42424242424244,40L246.4646464646465,37.89999999999999L250.50505050505052,35.599999999999994L254.5454545454546,33.099999999999994L258.5858585858586,30.39999999999999L262.62626262626264,27.5L266.6666666666667,24.399999999999977L270.7070707070707,21.099999999999994L274.74747474747477,17.59999999999998L278.7878787878788,13.899999999999977L282.82828282828285,10L286.8686868686869,5.899999999999977L290.90909090909093,1.5999999999999943L294.949494949495,-2.900000000000034L298.989898989899,-7.600000000000023L303.030303030303,-12.5L307.0707070707071,-17.600000000000023L311.11111111111114,-22.900000000000006L315.1515151515152,-28.400000000000034L319.1919191919192,-34.10000000000002L323.2323232323232,-40L327.27272727272725,-46.09999999999998L331.31313131313135,-52.40000000000008L335.3535353535354,-58.900000000000034L339.3939393939394,-65.60000000000002L343.4343434343434,-72.5L347.47474747474746,-79.59999999999997L351.51515151515156,-86.90000000000009L355.5555555555556,-94.40000000000006L359.5959595959596,-102.10000000000002L363.6363636363636,-110L367.67676767676767,-118.1L371.71717171717177,-126.40000000000009L375.75757575757575,-134.90000000000006L379.7979797979798,-143.60000000000002L383.83838383838383,-152.5L387.87878787878793,-161.60000000000014L391.919191919192,-170.9000000000001L395.95959595959596,-180.40000000000006L400,-190.10000000000005L400,0L395.95959595959596,0L391.919191919192,0L387.87878787878793,0L383.83838383838383,0L379.7979797979798,0L375.75757575757575,0L371.71717171717177,0L367.67676767676767,0L363.6363636363636,0L359.5959595959596,0L355.5555555555556,0L351.51515151515156,0L347.47474747474746,0L343.4343434343434,0L339.3939393939394,0L335.3535353535354,0L331.31313131313135,0L327.27272727272725,0L323.2323232323232,0L319.1919191919192,0L315.1515151515152,0L311.11111111111114,0L307.0707070707071,0L303.030303030303,0L298.989898989899,-7.105427357601002e-15L294.949494949495,0L290.90909090909093,0L286.8686868686869,0L282.82828282828285,0L278.7878787878788,-7.105427357601002e-15L274.74747474747477,0L270.7070707070707,0L266.6666666666667,0L262.62626262626264,0L258.5858585858586,0L254.5454545454546,7.105427357601002e-15L250.50505050505052,7.105427357601002e-15L246.4646464646465,0L242.42424242424244,0L238.3838383838384,0L234.34343434343435,0L230.3030303030303,0L226.26262626262624,0L222.22222222222223,0L218.18181818181822,7.105427357601002e-15L214.14141414141415,-7.105427357601002e-15L210.10101010101013,0L206.06060606060606,0L202.02020202020202,0L197.97979797979798,0L193.93939393939397,1.4210854715202004e-14L189.8989898989899,-7.105427357601002e-15L185.85858585858588,7.105427357601002e-15L181.8181818181818,0L177.7777777777778,0L173.73737373737373,0L169.6969696969697,0L165.65656565656568,-7.105427357601002e-15L161.6161616161616,0L157.5757575757576,0L153.53535353535355,0L149.4949494949495,0L145.45454545454547,-3.552713678800501e-15L141.41414141414143,0L137.37373737373738,-7.105427357601002e-15L133.33333333333334,-3.552713678800501e-15L129.2929292929293,0L125.25252525252526,0L121.21212121212122,0L117.17171717171718,-7.105427357601002e-15L113.13131313131312,0L109.09090909090911,0L105.05050505050507,7.105427357601002e-15L101.01010101010101,0L96.96969696969698,0L92.92929292929294,0L88.8888888888889,0L84.84848484848484,0L80.8080808080808,0L76.76767676767679,0L72.72727272727272,0L68.68686868686869,0L64.64646464646465,0L60.60606060606061,0L56.565656565656575,0L52.52525252525252,0L48.48484848484849,0L44.44444444444445,0L40.4040404040404,0L36.363636363636374,0L32.32323232323232,0L28.282828282828287,0L24.242424242424228,0L20.2020202020202,0L16.161616161616173,0L12.121212121212114,0L8.080808080808087,0L4.0404040404040265,0L0,0Z" fill="rgb(241,183,183)"/>
</g>
</g><g clip-path="url(#89)"><clippath id="89"><rect x="0" y="0" width="400" height="80"/>
</clippath><g><path d="M0,-40L4.0404040404040265,-30.10000000000005L8.080808080808087,-20.400000000000006L12.121212121212114,-10.900000000000034L16.161616161616173,-1.599999999999966L20.2020202020202,7.5L24.242424242424228,16.399999999999977L28.282828282828287,25.100000000000023L32.32323232323232,33.599999999999994L36.363636363636374,41.900000000000006L40.4040404040404,50L44.44444444444445,57.900000000000006L48.48484848484849,65.6L52.52525252525252,73.09999999999997L56.565656565656575,80.40000000000003L60.60606060606061,87.5L64.64646464646465,94.40000000000002L68.68686868686869,101.10000000000002L72.72727272727272,107.59999999999998L76.76767676767679,113.90000000000002L80.8080808080808,120L84.84848484848484,125.89999999999999L88.8888888888889,131.60000000000002L92.92929292929294,137.10000000000002L96.96969696969698,142.40000000000003L101.01010101010101,147.5L105.05050505050507,152.4L109.09090909090911,157.10000000000002L113.13131313131312,161.60000000000002L117.17171717171718,165.9L121.21212121212122,170L125.25252525252526,173.9L129.2929292929293,177.60000000000002L133.33333333333334,181.10000000000002L137.37373737373738,184.4L141.41414141414143,187.5L145.45454545454547,190.4L149.4949494949495,193.10000000000002L153.53535353535355,195.60000000000002L157.5757575757576,197.9L161.6161616161616,200L165.65656565656568,201.9L169.6969696969697,203.6L173.73737373737373,205.1L177.7777777777778,206.4L181.8181818181818,207.5L185.85858585858588,208.4L189.8989898989899,209.1L193.93939393939397,209.60000000000002L197.97979797979798,209.9L202.02020202020202,210L206.06060606060606,209.9L210.10101010101013,209.6L214.14141414141415,209.1L218.18181818181822,208.4L222.22222222222223,207.5L226.26262626262624,206.39999999999998L230.3030303030303,205.1L234.34343434343435,203.6L238.3838383838384,201.89999999999998L242.42424242424244,200L246.4646464646465,197.89999999999998L250.50505050505052,195.6L254.5454545454546,193.1L258.5858585858586,190.39999999999998L262.62626262626264,187.5L266.6666666666667,184.39999999999998L270.7070707070707,181.1L274.74747474747477,177.59999999999997L278.7878787878788,173.89999999999998L282.82828282828285,170L286.8686868686869,165.89999999999998L290.90909090909093,161.6L294.949494949495,157.09999999999997L298.989898989899,152.39999999999998L303.030303030303,147.5L307.0707070707071,142.39999999999998L311.11111111111114,137.1L315.1515151515152,131.59999999999997L319.1919191919192,125.89999999999998L323.2323232323232,120L327.27272727272725,113.90000000000002L331.31313131313135,107.59999999999992L335.3535353535354,101.09999999999997L339.3939393939394,94.39999999999998L343.4343434343434,87.5L347.47474747474746,80.40000000000003L351.51515151515156,73.09999999999991L355.5555555555556,65.59999999999994L359.5959595959596,57.89999999999998L363.6363636363636,50L367.67676767676767,41.900000000000006L371.71717171717177,33.59999999999991L375.75757575757575,25.099999999999937L379.7979797979798,16.399999999999977L383.83838383838383,7.5L387.87878787878793,-1.6000000000001364L391.919191919192,-10.900000000000091L395.95959595959596,-20.400000000000063L400,-30.10000000000005L400,160L395.95959595959596,160L391.919191919192,160L387.87878787878793,160L383.83838383838383,160L379.7979797979798,160L375.75757575757575,160L371.71717171717177,160L367.67676767676767,160L363.6363636363636,160L359.5959595959596,160L355.5555555555556,160L351.51515151515156,160L347.47474747474746,160L343.4343434343434,160L339.3939393939394,160L335.3535353535354,160L331.31313131313135,160L327.27272727272725,160L323.2323232323232,160L319.1919191919192,160L315.1515151515152,160L311.11111111111114,160L307.0707070707071,160L303.030303030303,160L298.989898989899,160L294.949494949495,160L290.90909090909093,160L286.8686868686869,160L282.82828282828285,160L278.7878787878788,160L274.74747474747477,160L270.7070707070707,160L266.6666666666667,160L262.62626262626264,160L258.5858585858586,160L254.5454545454546,160L250.50505050505052,160L246.4646464646465,160L242.42424242424244,160L238.3838383838384,160L234.34343434343435,160L230.3030303030303,160L226.26262626262624,160L222.22222222222223,160L218.18181818181822,160L214.14141414141415,160L210.10101010101013,160L206.06060606060606,160L202.02020202020202,160L197.97979797979798,160L193.93939393939397,160L189.8989898989899,160L185.85858585858588,160L181.8181818181818,160L177.7777777777778,160L173.73737373737373,160L169.6969696969697,160L165.65656565656568,160L161.6161616161616,160L157.5757575757576,160L153.53535353535355,160L149.4949494949495,160L145.45454545454547,160L141.41414141414143,160L137.37373737373738,160L133.33333333333334,160L129.2929292929293,160L125.25252525252526,160L121.21212121212122,160L117.17171717171718,160L113.13131313131312,160L109.09090909090911,160L105.05050505050507,160L101.01010101010101,160L96.96969696969698,160L92.92929292929294,160L88.8888888888889,160L84.84848484848484,160L80.8080808080808,160L76.76767676767679,160L72.72727272727272,160L68.68686868686869,160L64.64646464646465,160L60.60606060606061,160L56.565656565656575,160L52.52525252525252,160L48.48484848484849,160L44.44444444444445,160L40.4040404040404,160L36.363636363636374,160L32.32323232323232,160L28.282828282828287,160L24.242424242424228,160L20.2020202020202,160L16.161616161616173,160L12.121212121212114,160L8.080808080808087,160L4.0404040404040265,160L0,160Z" fill="rgb(106,164,205)"/>
</g>
</g><g clip-path="url(#8a)"><clippath id="8a"><rect x="0" y="0" width="400" height="80"/>
</clippath><g><path d="M0,-280L4.0404040404040265,-270.1L8.080808080808087,-260.4L12.121212121212114,-250.90000000000003L16.161616161616173,-241.59999999999997L20.2020202020202,-232.5L24.242424242424228,-223.60000000000002L28.282828282828287,-214.89999999999998L32.32323232323232,-206.4L36.363636363636374,-198.1L40.4040404040404,-190L44.44444444444445,-182.1L48.48484848484849,-174.4L52.52525252525252,-166.90000000000003L56.565656565656575,-159.59999999999997L60.60606060606061,-152.5L64.64646464646465,-145.59999999999997L68.68686868686869,-138.89999999999998L72.72727272727272,-132.40000000000003L76.76767676767679,-126.09999999999998L80.8080808080808,-120L84.84848484848484,-114.10000000000001L88.8888888888889,-108.39999999999998L92.92929292929294,-102.89999999999998L96.96969696969698,-97.59999999999998L101.01010101010101,-92.5L105.05050505050507,-87.6L109.09090909090911,-82.89999999999999L113.13131313131312,-78.39999999999999L117.17171717171718,-74.1L121.21212121212122,-70L125.25252525252526,-66.1L129.2929292929293,-62.39999999999999L133.33333333333334,-58.89999999999999L137.37373737373738,-55.599999999999994L141.41414141414143,-52.5L145.45454545454547,-49.599999999999994L149.4949494949495,-46.89999999999999L153.53535353535355,-44.39999999999999L157.5757575757576,-42.099999999999994L161.6161616161616,-40L165.65656565656568,-38.099999999999994L169.6969696969697,-36.400000000000006L173.73737373737373,-34.900000000000006L177.7777777777778,-33.599999999999994L181.8181818181818,-32.5L185.85858585858588,-31.599999999999994L189.8989898989899,-30.900000000000006L193.93939393939397,-30.399999999999977L197.97979797979798,-30.099999999999994L202.02020202020202,-30L206.06060606060606,-30.099999999999994L210.10101010101013,-30.400000000000006L214.14141414141415,-30.900000000000006L218.18181818181822,-31.599999999999994L222.22222222222223,-32.5L226.26262626262624,-33.60000000000001L230.3030303030303,-34.900000000000006L234.34343434343435,-36.400000000000006L238.3838383838384,-38.10000000000001L242.42424242424244,-40L246.4646464646465,-42.10000000000001L250.50505050505052,-44.400000000000006L254.5454545454546,-46.900000000000006L258.5858585858586,-49.60000000000001L262.62626262626264,-52.5L266.6666666666667,-55.60000000000002L270.7070707070707,-58.900000000000006L274.74747474747477,-62.40000000000002L278.7878787878788,-66.10000000000002L282.82828282828285,-70L286.8686868686869,-74.10000000000002L290.90909090909093,-78.4L294.949494949495,-82.90000000000003L298.989898989899,-87.60000000000002L303.030303030303,-92.5L307.0707070707071,-97.60000000000002L311.11111111111114,-102.9L315.1515151515152,-108.40000000000003L319.1919191919192,-114.10000000000002L323.2323232323232,-120L327.27272727272725,-126.09999999999998L331.31313131313135,-132.4000000000001L335.3535353535354,-138.90000000000003L339.3939393939394,-145.60000000000002L343.4343434343434,-152.5L347.47474747474746,-159.59999999999997L351.51515151515156,-166.9000000000001L355.5555555555556,-174.40000000000006L359.5959595959596,-182.10000000000002L363.6363636363636,-190L367.67676767676767,-198.1L371.71717171717177,-206.4000000000001L375.75757575757575,-214.90000000000006L379.7979797979798,-223.60000000000002L383.83838383838383,-232.5L387.87878787878793,-241.60000000000014L391.919191919192,-250.9000000000001L395.95959595959596,-260.4000000000001L400,-270.1L400,-79.99999999999997L395.95959595959596,-80.00000000000003L391.919191919192,-80L387.87878787878793,-80L383.83838383838383,-80L379.7979797979798,-80L375.75757575757575,-80L371.71717171717177,-80L367.67676767676767,-80L363.6363636363636,-80L359.5959595959596,-80L355.5555555555556,-80L351.51515151515156,-80L347.47474747474746,-80L343.4343434343434,-80L339.3939393939394,-80L335.3535353535354,-80L331.31313131313135,-80.00000000000001L327.27272727272725,-80L323.2323232323232,-80L319.1919191919192,-80L315.1515151515152,-80L311.11111111111114,-80L307.0707070707071,-80L303.030303030303,-80L298.989898989899,-80L294.949494949495,-80L290.90909090909093,-80L286.8686868686869,-80L282.82828282828285,-80L278.7878787878788,-80L274.74747474747477,-80L270.7070707070707,-80L266.6666666666667,-80L262.62626262626264,-80L258.5858585858586,-80L254.5454545454546,-80L250.50505050505052,-80L246.4646464646465,-80L242.42424242424244,-80L238.3838383838384,-80L234.34343434343435,-80L230.3030303030303,-80L226.26262626262624,-80L222.22222222222223,-80L218.18181818181822,-80L214.14141414141415,-80L210.10101010101013,-80L206.06060606060606,-80L202.02020202020202,-80L197.97979797979798,-80L193.93939393939397,-79.99999999999999L189.8989898989899,-80L185.85858585858588,-80L181.8181818181818,-80L177.7777777777778,-80L173.73737373737373,-80L169.6969696969697,-80L165.65656565656568,-80L161.6161616161616,-80L157.5757575757576,-80L153.53535353535355,-80L149.4949494949495,-80L145.45454545454547,-80L141.41414141414143,-80L137.37373737373738,-80L133.33333333333334,-80L129.2929292929293,-80L125.25252525252526,-80L121.21212121212122,-80L117.17171717171718,-80L113.13131313131312,-80L109.09090909090911,-80L105.05050505050507,-80L101.01010101010101,-80L96.96969696969698,-80L92.92929292929294,-80L88.8888888888889,-80L84.84848484848484,-80L80.8080808080808,-80L76.76767676767679,-80L72.72727272727272,-80.00000000000001L68.68686868686869,-80L64.64646464646465,-79.99999999999999L60.60606060606061,-80L56.565656565656575,-80L52.52525252525252,-80L48.48484848484849,-80L44.44444444444445,-80L40.4040404040404,-80L36.363636363636374,-80L32.32323232323232,-80L28.282828282828287,-80L24.242424242424228,-80L20.2020202020202,-80L16.161616161616173,-80L12.121212121212114,-80L8.080808080808087,-79.99999999999997L4.0404040404040265,-79.99999999999997L0,-80Z" fill="rgb(228,111,112)"/>
</g>
</g><g clip-path="url(#8b)"><clippath id="8b"><rect x="0" y="0" width="400" height="80"/>
</clippath><g><path d="M0,40L4.0404040404040265,49.89999999999995L8.080808080808087,59.599999999999994L12.121212121212114,69.09999999999997L16.161616161616173,78.40000000000003L20.2020202020202,87.5L24.242424242424228,96.39999999999998L28.282828282828287,105.10000000000002L32.32323232323232,113.6L36.363636363636374,121.9L40.4040404040404,130L44.44444444444445,137.9L48.48484848484849,145.6L52.52525252525252,153.09999999999997L56.565656565656575,160.40000000000003L60.60606060606061,167.5L64.64646464646465,174.40000000000003L68.68686868686869,181.10000000000002L72.72727272727272,187.59999999999997L76.76767676767679,193.90000000000003L80.8080808080808,200L84.84848484848484,205.89999999999998L88.8888888888889,211.60000000000002L92.92929292929294,217.10000000000002L96.96969696969698,222.40000000000003L101.01010101010101,227.5L105.05050505050507,232.4L109.09090909090911,237.10000000000002L113.13131313131312,241.60000000000002L117.17171717171718,245.9L121.21212121212122,250L125.25252525252526,253.9L129.2929292929293,257.6L133.33333333333334,261.1L137.37373737373738,264.4L141.41414141414143,267.5L145.45454545454547,270.4L149.4949494949495,273.1L153.53535353535355,275.6L157.5757575757576,277.9L161.6161616161616,280L165.65656565656568,281.9L169.6969696969697,283.6L173.73737373737373,285.1L177.7777777777778,286.4L181.8181818181818,287.5L185.85858585858588,288.4L189.8989898989899,289.1L193.93939393939397,289.6L197.97979797979798,289.9L202.02020202020202,290L206.06060606060606,289.9L210.10101010101013,289.6L214.14141414141415,289.1L218.18181818181822,288.4L222.22222222222223,287.5L226.26262626262624,286.4L230.3030303030303,285.1L234.34343434343435,283.6L238.3838383838384,281.9L242.42424242424244,280L246.4646464646465,277.9L250.50505050505052,275.6L254.5454545454546,273.1L258.5858585858586,270.4L262.62626262626264,267.5L266.6666666666667,264.4L270.7070707070707,261.1L274.74747474747477,257.59999999999997L278.7878787878788,253.89999999999998L282.82828282828285,250L286.8686868686869,245.89999999999998L290.90909090909093,241.6L294.949494949495,237.09999999999997L298.989898989899,232.39999999999998L303.030303030303,227.5L307.0707070707071,222.39999999999998L311.11111111111114,217.1L315.1515151515152,211.59999999999997L319.1919191919192,205.89999999999998L323.2323232323232,200L327.27272727272725,193.90000000000003L331.31313131313135,187.5999999999999L335.3535353535354,181.09999999999997L339.3939393939394,174.39999999999998L343.4343434343434,167.5L347.47474747474746,160.40000000000003L351.51515151515156,153.0999999999999L355.5555555555556,145.59999999999994L359.5959595959596,137.89999999999998L363.6363636363636,130L367.67676767676767,121.9L371.71717171717177,113.59999999999991L375.75757575757575,105.09999999999994L379.7979797979798,96.39999999999998L383.83838383838383,87.5L387.87878787878793,78.39999999999986L391.919191919192,69.09999999999991L395.95959595959596,59.59999999999994L400,49.89999999999995L400,240L395.95959595959596,240L391.919191919192,240L387.87878787878793,240L383.83838383838383,240L379.7979797979798,240L375.75757575757575,240L371.71717171717177,240L367.67676767676767,240L363.6363636363636,240L359.5959595959596,240L355.5555555555556,240L351.51515151515156,240L347.47474747474746,240L343.4343434343434,240L339.3939393939394,240L335.3535353535354,240L331.31313131313135,240L327.27272727272725,240L323.2323232323232,240L319.1919191919192,240L315.1515151515152,240L311.11111111111114,240L307.0707070707071,240L303.030303030303,240L298.989898989899,240L294.949494949495,240L290.90909090909093,240L286.8686868686869,240L282.82828282828285,240L278.7878787878788,240L274.74747474747477,240L270.7070707070707,240.00000000000003L266.6666666666667,240L262.62626262626264,240L258.5858585858586,240L254.5454545454546,240.00000000000003L250.50505050505052,240.00000000000003L246.4646464646465,240L242.42424242424244,240L238.3838383838384,240L234.34343434343435,240.00000000000003L230.3030303030303,240.00000000000003L226.26262626262624,240L222.22222222222223,240L218.18181818181822,239.99999999999997L214.14141414141415,240.00000000000003L210.10101010101013,240.00000000000003L206.06060606060606,239.99999999999997L202.02020202020202,240L197.97979797979798,239.99999999999997L193.93939393939397,240L189.8989898989899,240.00000000000003L185.85858585858588,239.99999999999997L181.8181818181818,240L177.7777777777778,239.99999999999997L173.73737373737373,240.00000000000003L169.6969696969697,240.00000000000003L165.65656565656568,239.99999999999997L161.6161616161616,240L157.5757575757576,239.99999999999997L153.53535353535355,240L149.4949494949495,240L145.45454545454547,239.99999999999997L141.41414141414143,240L137.37373737373738,239.99999999999997L133.33333333333334,240L129.2929292929293,240L125.25252525252526,240L121.21212121212122,240L117.17171717171718,240L113.13131313131312,240L109.09090909090911,240L105.05050505050507,240L101.01010101010101,240L96.96969696969698,240L92.92929292929294,240L88.8888888888889,240L84.84848484848484,240L80.8080808080808,240L76.76767676767679,240L72.72727272727272,240L68.68686868686869,240L64.64646464646465,240L60.60606060606061,240L56.565656565656575,240L52.52525252525252,240L48.48484848484849,240L44.44444444444445,240L40.4040404040404,240L36.363636363636374,240L32.32323232323232,240L28.282828282828287,240L24.242424242424228,240L20.2020202020202,240L16.161616161616173,240L12.121212121212114,240L8.080808080808087,240L4.0404040404040265,240L0,240Z" fill="rgb(31,119,180)"/>
</g>
</g><g clip-path="url(#8c)"><clippath id="8c"><rect x="0" y="0" width="400" height="80"/>
</clippath><g><path d="M0,-360L4.0404040404040265,-350.1L8.080808080808087,-340.4L12.121212121212114,-330.90000000000003L16.161616161616173,-321.59999999999997L20.2020202020202,-312.5L24.242424242424228,-303.6L28.282828282828287,-294.9L32.32323232323232,-286.4L36.363636363636374,-278.1L40.4040404040404,-270L44.44444444444445,-262.1L48.48484848484849,-254.4L52.52525252525252,-246.90000000000003L56.565656565656575,-239.59999999999997L60.60606060606061,-232.5L64.64646464646465,-225.59999999999997L68.68686868686869,-218.89999999999998L72.72727272727272,-212.40000000000003L76.76767676767679,-206.09999999999997L80.8080808080808,-200L84.84848484848484,-194.10000000000002L88.8888888888889,-188.39999999999998L92.92929292929294,-182.89999999999998L96.96969696969698,-177.59999999999997L101.01010101010101,-172.5L105.05050505050507,-167.6L109.09090909090911,-162.89999999999998L113.13131313131312,-158.39999999999998L117.17171717171718,-154.1L121.21212121212122,-150L125.25252525252526,-146.1L129.2929292929293,-142.39999999999998L133.33333333333334,-138.89999999999998L137.37373737373738,-135.6L141.41414141414143,-132.5L145.45454545454547,-129.6L149.4949494949495,-126.89999999999999L153.53535353535355,-124.39999999999999L157.5757575757576,-122.1L161.6161616161616,-120L165.65656565656568,-118.1L169.6969696969697,-116.4L173.73737373737373,-114.9L177.7777777777778,-113.6L181.8181818181818,-112.5L185.85858585858588,-111.6L189.8989898989899,-110.9L193.93939393939397,-110.39999999999998L197.97979797979798,-110.1L202.02020202020202,-110L206.06060606060606,-110.1L210.10101010101013,-110.4L214.14141414141415,-110.9L218.18181818181822,-111.6L222.22222222222223,-112.5L226.26262626262624,-113.60000000000001L230.3030303030303,-114.9L234.34343434343435,-116.4L238.3838383838384,-118.10000000000001L242.42424242424244,-120L246.4646464646465,-122.10000000000001L250.50505050505052,-124.4L254.5454545454546,-126.9L258.5858585858586,-129.60000000000002L262.62626262626264,-132.5L266.6666666666667,-135.60000000000002L270.7070707070707,-138.9L274.74747474747477,-142.40000000000003L278.7878787878788,-146.10000000000002L282.82828282828285,-150L286.8686868686869,-154.10000000000002L290.90909090909093,-158.4L294.949494949495,-162.90000000000003L298.989898989899,-167.60000000000002L303.030303030303,-172.5L307.0707070707071,-177.60000000000002L311.11111111111114,-182.9L315.1515151515152,-188.40000000000003L319.1919191919192,-194.10000000000002L323.2323232323232,-200L327.27272727272725,-206.09999999999997L331.31313131313135,-212.4000000000001L335.3535353535354,-218.90000000000003L339.3939393939394,-225.60000000000002L343.4343434343434,-232.5L347.47474747474746,-239.59999999999997L351.51515151515156,-246.9000000000001L355.5555555555556,-254.40000000000006L359.5959595959596,-262.1L363.6363636363636,-270L367.67676767676767,-278.1L371.71717171717177,-286.4000000000001L375.75757575757575,-294.9000000000001L379.7979797979798,-303.6L383.83838383838383,-312.5L387.87878787878793,-321.60000000000014L391.919191919192,-330.9000000000001L395.95959595959596,-340.4000000000001L400,-350.1L400,-159.99999999999997L395.95959595959596,-160.00000000000003L391.919191919192,-160L387.87878787878793,-160L383.83838383838383,-160L379.7979797979798,-160L375.75757575757575,-160.00000000000003L371.71717171717177,-160L367.67676767676767,-160.00000000000003L363.6363636363636,-160L359.5959595959596,-160L355.5555555555556,-160L351.51515151515156,-160L347.47474747474746,-160L343.4343434343434,-160L339.3939393939394,-160L335.3535353535354,-160L331.31313131313135,-160L327.27272727272725,-160L323.2323232323232,-160L319.1919191919192,-160L315.1515151515152,-160L311.11111111111114,-160L307.0707070707071,-160L303.030303030303,-160L298.989898989899,-160L294.949494949495,-160L290.90909090909093,-160L286.8686868686869,-160L282.82828282828285,-160L278.7878787878788,-160L274.74747474747477,-160L270.7070707070707,-160L266.6666666666667,-160L262.62626262626264,-160L258.5858585858586,-160L254.5454545454546,-160L250.50505050505052,-160L246.4646464646465,-160L242.42424242424244,-160L238.3838383838384,-160L234.34343434343435,-160L230.3030303030303,-160L226.26262626262624,-160L222.22222222222223,-160L218.18181818181822,-160L214.14141414141415,-160L210.10101010101013,-160L206.06060606060606,-160L202.02020202020202,-160L197.97979797979798,-160L193.93939393939397,-160L189.8989898989899,-160L185.85858585858588,-160L181.8181818181818,-160L177.7777777777778,-160L173.73737373737373,-160L169.6969696969697,-160L165.65656565656568,-160L161.6161616161616,-160L157.5757575757576,-160L153.53535353535355,-160L149.4949494949495,-160L145.45454545454547,-160L141.41414141414143,-160L137.37373737373738,-160L133.33333333333334,-160L129.2929292929293,-160L125.25252525252526,-160L121.21212121212122,-160L117.17171717171718,-160L113.13131313131312,-160L109.09090909090911,-160L105.05050505050507,-160L101.01010101010101,-160L96.96969696969698,-160L92.92929292929294,-160L88.8888888888889,-160L84.84848484848484,-160L80.8080808080808,-160L76.76767676767679,-160L72.72727272727272,-160L68.68686868686869,-160L64.64646464646465,-160L60.60606060606061,-160L56.565656565656575,-160L52.52525252525252,-160L48.48484848484849,-160L44.44444444444445,-160.00000000000003L40.4040404040404,-160L36.363636363636374,-160.00000000000003L32.32323232323232,-159.99999999999997L28.282828282828287,-160L24.242424242424228,-160L20.2020202020202,-160L16.161616161616173,-160L12.121212121212114,-160L8.080808080808087,-159.99999999999997L4.0404040404040265,-159.99999999999997L0,-160Z" fill="rgb(214,39,40)"/>
</g>
</g>
</g>
</g>
</g>
</svg>
EOF
      @rv_svg=Nokogiri::XML(@vis.to_svg)
      @pv_svg=Nokogiri::XML(html_out)
    end
    
    it "should render correct number of clipaths" do
      
      @rv_svg.xpath("//xmlns:clipPath[@id]").size.should eq @pv_svg.xpath("//clippath[@id]").size
    end
    it "should render equal paths" do
      pv_paths=@pv_svg.xpath("//path")
      @rv_svg.xpath("//xmlns:path").each_with_index {|rv_path,i|
        rv_path.should have_path_data_close_to pv_paths[i]['d']
        rv_path['fill'].should eq pv_paths[i]['fill']
      }
    end
  end
end