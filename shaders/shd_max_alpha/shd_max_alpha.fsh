//
// takes a colour blended onto a 0 alpha black and makes it a 1 alpha original colour
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	float Alpha = sqrt(col.a);
	
	if ((col.a > 0.0) && (col.a < 1.0)) {
		col.a = 1.0;
		col.r *= 1.0/Alpha;
		col.g *= 1.0/Alpha;
		col.b *= 1.0/Alpha;
	}
	gl_FragColor = col;
}
