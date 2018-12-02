// real directory_destroy_fmns(string dname)

if (os_type == os_windows)
{
    var FileManager_result = external_call(external_define("FileManager.dll", "directory_destroy", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("FileManager.dll");
    return FileManager_result;
}

if (os_type == os_macosx)
{
    var FileManager_result = external_call(external_define("FileManager.dylib", "directory_destroy", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("FileManager.dylib");
    return FileManager_result;
}
       
if (os_type == os_linux)
{
    var FileManager_result = external_call(external_define("FileManager.so", "directory_destroy", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("FileManager.so");
    return FileManager_result;
}