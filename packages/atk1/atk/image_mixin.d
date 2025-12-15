/// Module for [Image] interface mixin
module atk.image_mixin;

public import atk.image_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.types;
public import gid.gid;

/**
    The ATK Interface implemented by components
     which expose image or pixmap content on-screen.
    
    #AtkImage should be implemented by #AtkObject subtypes on behalf of
    components which display image/pixmap information onscreen, and
    which provide information (other than just widget borders, etc.)
    via that image content.  For instance, icons, buttons with icons,
    toolbar elements, and image viewing panes typically should
    implement #AtkImage.
    
    #AtkImage primarily provides two types of information: coordinate
    information (useful for screen review mode of screenreaders, and
    for use by onscreen magnifiers), and descriptive information.  The
    descriptive information is provided for alternative, text-only
    presentation of the most significant information present in the
    image.
*/
template ImageT()
{

  /**
      Get a textual description of this image.
      Returns: a string representing the image description
  */
  override string getImageDescription()
  {
    const(char)* _cretval;
    _cretval = atk_image_get_image_description(cast(AtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the locale identifier associated to the #AtkImage.
      Returns: a string corresponding to the POSIX
          `LC_MESSAGES` locale used by the image description, or
          null if the image does not specify a locale.
  */
  override string getImageLocale()
  {
    const(char)* _cretval;
    _cretval = atk_image_get_image_locale(cast(AtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the position of the image in the form of a point specifying the
      images top-left corner.
      
      If the position can not be obtained (e.g. missing support), x and y are set
      to -1.
  
      Params:
        x = address of #gint to put x coordinate position; otherwise, -1 if value cannot be obtained.
        y = address of #gint to put y coordinate position; otherwise, -1 if value cannot be obtained.
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  */
  override void getImagePosition(out int x, out int y, atk.types.CoordType coordType)
  {
    atk_image_get_image_position(cast(AtkImage*)this._cPtr, cast(int*)&x, cast(int*)&y, coordType);
  }

  /**
      Get the width and height in pixels for the specified image.
      The values of width and height are returned as -1 if the
      values cannot be obtained (for instance, if the object is not onscreen).
      
      If the size can not be obtained (e.g. missing support), x and y are set
      to -1.
  
      Params:
        width = filled with the image width, or -1 if the value cannot be obtained.
        height = filled with the image height, or -1 if the value cannot be obtained.
  */
  override void getImageSize(out int width, out int height)
  {
    atk_image_get_image_size(cast(AtkImage*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Sets the textual description for this image.
  
      Params:
        description = a string description to set for image
      Returns: boolean TRUE, or FALSE if operation could
        not be completed.
  */
  override bool setImageDescription(string description)
  {
    bool _retval;
    const(char)* _description = description.toCString(No.Alloc);
    _retval = cast(bool)atk_image_set_image_description(cast(AtkImage*)this._cPtr, _description);
    return _retval;
  }
}
