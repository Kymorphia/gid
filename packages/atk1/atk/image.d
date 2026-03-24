/// Module for [Image] interface
module atk.image;

public import atk.image_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.gid_builder;

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
interface Image
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_image_get_type != &gidSymbolNotFound ? atk_image_get_type() : cast(GType)0;
  }

  /**
      Get a textual description of this image.
      Returns: a string representing the image description
  */
  string getImageDescription();

  /**
      Retrieves the locale identifier associated to the #AtkImage.
      Returns: a string corresponding to the POSIX
          `LC_MESSAGES` locale used by the image description, or
          null if the image does not specify a locale.
  */
  string getImageLocale();

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
  void getImagePosition(out int x, out int y, atk.types.CoordType coordType);

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
  void getImageSize(out int width, out int height);

  /**
      Sets the textual description for this image.
  
      Params:
        description = a string description to set for image
      Returns: boolean TRUE, or FALSE if operation could
        not be completed.
  */
  bool setImageDescription(string description);
}

interface ImageGidBuilderImpl(T)
{
}
