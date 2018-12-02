// string temp_directory_fmns()
    
if (os_type == os_windows)
{
    var FileManager_result = external_call(external_define("FileManager.dll", "temp_directory", dll_cdecl, ty_string, 0));
    external_free("FileManager.dll");
    return FileManager_result;
}

if (os_type == os_macosx)
{
    var FileManager_result = external_call(external_define("FileManager.dylib", "temp_directory", dll_cdecl, ty_string, 0));
    external_free("FileManager.dylib");
    return FileManager_result;
}
       
if (os_type == os_linux)
{
    var FileManager_result = external_call(external_define("FileManager.so", "temp_directory", dll_cdecl, ty_string, 0));
    external_free("FileManager.so");
    return FileManager_result;
}