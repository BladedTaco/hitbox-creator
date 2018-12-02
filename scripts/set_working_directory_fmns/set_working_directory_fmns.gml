// real set_working_directory_fmns(string dname)

if (os_type == os_windows)
{
    var FileManager_result = external_call(external_define("FileManager.dll", "set_working_directory", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("FileManager.dll");
    return FileManager_result;
}

if (os_type == os_macosx)
{
    var FileManager_result = external_call(external_define("FileManager.dylib", "set_working_directory", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("FileManager.dylib");
    return FileManager_result;
}
       
if (os_type == os_linux)
{
    var FileManager_result = external_call(external_define("FileManager.so", "set_working_directory", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("FileManager.so");
    return FileManager_result;
}