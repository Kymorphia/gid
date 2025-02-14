module Gtk.FileChooserNativeClass;

import Gid.gid;
import Gtk.NativeDialogClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class FileChooserNativeClass
{
  GtkFileChooserNativeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.FileChooserNativeClass");

    cInstance = *cast(GtkFileChooserNativeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property NativeDialogClass parentClass()
  {
    return new NativeDialogClass(cast(GtkNativeDialogClass*)&(cast(GtkFileChooserNativeClass*)cPtr).parentClass);
  }
}
