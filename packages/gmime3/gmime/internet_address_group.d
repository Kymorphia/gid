/// Module for [InternetAddressGroup] class
module gmime.internet_address_group;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.internet_address;
import gmime.internet_address_list;
import gmime.types;
import gobject.object;

/**
    An RFC 2822 Group address.
*/
class InternetAddressGroup : gmime.internet_address.InternetAddress
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())internet_address_group_get_type != &gidSymbolNotFound ? internet_address_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddressGroup self()
  {
    return this;
  }

  /**
      Creates a new #InternetAddressGroup object with the specified
      name.
  
      Params:
        name = group name
      Returns: a new #InternetAddressGroup object.
        
        Note: The name string should be in UTF-8.
  */
  this(string name)
  {
    GMimeInternetAddress* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = internet_address_group_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Add a contact to the internet address group.
  
      Params:
        member = a #InternetAddress
      Returns: the index of the newly added member.
  */
  int addMember(gmime.internet_address.InternetAddress member)
  {
    int _retval;
    _retval = internet_address_group_add_member(cast(GMimeInternetAddressGroup*)this._cPtr, member ? cast(GMimeInternetAddress*)member._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #InternetAddressList containing the group members of an
      rfc822 group address.
      Returns: a #InternetAddressList containing the
        members of group.
  */
  gmime.internet_address_list.InternetAddressList getMembers()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = internet_address_group_get_members(cast(GMimeInternetAddressGroup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the members of the internet address group.
  
      Params:
        members = a #InternetAddressList
  */
  void setMembers(gmime.internet_address_list.InternetAddressList members)
  {
    internet_address_group_set_members(cast(GMimeInternetAddressGroup*)this._cPtr, members ? cast(GMimeInternetAddressList*)members._cPtr(No.Dup) : null);
  }
}
