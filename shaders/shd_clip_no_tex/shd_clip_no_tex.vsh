//a shader to restrict drawing to an area, ignoring textures
attribute vec3 in_Position;
attribute vec4 in_Colour;

varying vec4 v_vColour;
varying vec3 v_vPosition;

void main() {
    v_vPosition = in_Position;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]
        * vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    v_vColour = in_Colour;
}