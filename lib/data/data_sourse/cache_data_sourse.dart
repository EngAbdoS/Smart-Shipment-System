// run time cache

const CACHE_USER_DATA_KEY = "CACHE_USER_DATA_KEY";
const CACHE_ALL_SHIPMENT_LIST = "CACHE_ALL_SHIPMENT_LIST";


const CACHE_USER_DATA_INTRVAL = 60 * 1000;
abstract class CacheDataSource {

  void putDataToCache(String key, dynamic data);
  Future<CachedItem> getDataFromCache(String key);
 void clearCache();
  void removeFromCache(String key);
}


class CacheDataSourceImplementation implements CacheDataSource {

  Map<String, CachedItem> cacheMap = {};
  @override
 void putDataToCache(String key, data) async {
    cacheMap[key]=CachedItem(data);
  }

  @override
  Future<CachedItem> getDataFromCache(String key) async{
  return  cacheMap[key]??CachedItem(


    null
  );
  }

  @override
 void clearCache() async{
    cacheMap ={};
  }

  @override
  void removeFromCache(String key) async{
    cacheMap.remove(key);
  }






}


class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid({int expirationTime=CACHE_USER_DATA_INTRVAL}) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTime - cacheTime <= expirationTime;
    return isValid&&data!=null;
  }
}
