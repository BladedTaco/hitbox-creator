/// @description receive hitbox selection

obj_clipboard.caller_data = caller_data
exit;

var _table = obj_hitbox_table.table_list[obj_hitbox_table.frame]
var _data = []

for (var i = array_length_1d(caller_data) - 1; i >= 0; i--) {
	for (var o = 24; o >= 0; o--) {
		_data[i, o] = _table[caller_data[i], o]
	}
}