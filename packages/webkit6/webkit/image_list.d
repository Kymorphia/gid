/// Module for [ImageList] class
module webkit.image_list;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.image;
import webkit.types;

/**
    Represents a set of related images.
    
    The list supports iterating over each [webkit.image.Image]:
    
    ```c
    g_autoptr(WebKitImageList) list = webkit_favicon_database_get_page_icons_finish(database, result, NULL);
    for (gsize i = 0; i < webkit_image_list_get_length(list); i++) {
        WebKitImage *image = webkit_image_list_get(list, i);
        // Do something with "image".
    }
    ```
    
    Image lists can be obtained as the result of `id@webkit_favicon_database_get_page_icons`.
*/
class ImageList : gobject.boxed.BoxedWrap!(webkit_image_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ImageList self() nothrow
  {
    return this;
  }

  /**
      Gets an image given its index.
  
      Params:
        index = index of the image
      Returns: The image at index.
  */
  webkit.image.Image get(size_t index) nothrow
  {
    WebKitImage* _cretval;
    _cretval = webkit_image_list_get(cast(WebKitImageList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.image.Image)(cast(WebKitImage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of elements in the image list.
      Returns: number of elements.
  */
  size_t getLength() nothrow
  {
    size_t _retval;
    _retval = webkit_image_list_get_length(cast(WebKitImageList*)this._cPtr);
    return _retval;
  }
}
