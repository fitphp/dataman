<?php

/**
 * A helper file for Dcat Admin, to provide autocomplete information to your IDE
 *
 * This file should not be included in your code, only analyzed by your IDE!
 *
 * @author jqh <841324345@qq.com>
 */
namespace Dcat\Admin {
    use Illuminate\Support\Collection;

    /**
     * @property Grid\Column|Collection status
     * @property Grid\Column|Collection from
     * @property Grid\Column|Collection top
     * @property Grid\Column|Collection type
     * @property Grid\Column|Collection level
     * @property Grid\Column|Collection is_default
     * @property Grid\Column|Collection auth
     * @property Grid\Column|Collection id
     * @property Grid\Column|Collection name
     * @property Grid\Column|Collection key
     * @property Grid\Column|Collection value
     * @property Grid\Column|Collection remark
     * @property Grid\Column|Collection created_at
     * @property Grid\Column|Collection updated_at
     * @property Grid\Column|Collection role_id
     * @property Grid\Column|Collection menu_id
     * @property Grid\Column|Collection username
     * @property Grid\Column|Collection password
     * @property Grid\Column|Collection avatar
     * @property Grid\Column|Collection remember_token
     * @property Grid\Column|Collection type_id
     * @property Grid\Column|Collection order
     * @property Grid\Column|Collection parent_code
     * @property Grid\Column|Collection area_code
     * @property Grid\Column|Collection zip_code
     * @property Grid\Column|Collection city_code
     * @property Grid\Column|Collection short_name
     * @property Grid\Column|Collection merger_name
     * @property Grid\Column|Collection pinyin
     * @property Grid\Column|Collection lng
     * @property Grid\Column|Collection lat
     * @property Grid\Column|Collection user_id
     * @property Grid\Column|Collection version
     * @property Grid\Column|Collection detail
     * @property Grid\Column|Collection slug
     * @property Grid\Column|Collection permission_id
     * @property Grid\Column|Collection is_enabled
     * @property Grid\Column|Collection content
     * @property Grid\Column|Collection email
     * @property Grid\Column|Collection email_verified_at
     * @property Grid\Column|Collection uuid
     * @property Grid\Column|Collection connection
     * @property Grid\Column|Collection queue
     * @property Grid\Column|Collection payload
     * @property Grid\Column|Collection exception
     * @property Grid\Column|Collection failed_at
     * @property Grid\Column|Collection parent_id
     * @property Grid\Column|Collection image
     * @property Grid\Column|Collection subtitle
     * @property Grid\Column|Collection category_id
     * @property Grid\Column|Collection appid
     * @property Grid\Column|Collection url
     * @property Grid\Column|Collection flag
     * @property Grid\Column|Collection desc
     * @property Grid\Column|Collection channel_id
     * @property Grid\Column|Collection pin_id
     * @property Grid\Column|Collection start_at
     * @property Grid\Column|Collection end_at
     * @property Grid\Column|Collection category_ids
     * @property Grid\Column|Collection switch
     * @property Grid\Column|Collection path
     * @property Grid\Column|Collection method
     * @property Grid\Column|Collection ip
     * @property Grid\Column|Collection input
     * @property Grid\Column|Collection token
     * @property Grid\Column|Collection icon
     * @property Grid\Column|Collection uri
     * @property Grid\Column|Collection extension
     * @property Grid\Column|Collection target
     * @property Grid\Column|Collection platform_id
     * @property Grid\Column|Collection app_id
     * @property Grid\Column|Collection app_secret
     * @property Grid\Column|Collection http_method
     * @property Grid\Column|Collection http_path
     *
     * @method Grid\Column|Collection status(string $label = null)
     * @method Grid\Column|Collection from(string $label = null)
     * @method Grid\Column|Collection top(string $label = null)
     * @method Grid\Column|Collection type(string $label = null)
     * @method Grid\Column|Collection level(string $label = null)
     * @method Grid\Column|Collection is_default(string $label = null)
     * @method Grid\Column|Collection auth(string $label = null)
     * @method Grid\Column|Collection id(string $label = null)
     * @method Grid\Column|Collection name(string $label = null)
     * @method Grid\Column|Collection key(string $label = null)
     * @method Grid\Column|Collection value(string $label = null)
     * @method Grid\Column|Collection remark(string $label = null)
     * @method Grid\Column|Collection created_at(string $label = null)
     * @method Grid\Column|Collection updated_at(string $label = null)
     * @method Grid\Column|Collection role_id(string $label = null)
     * @method Grid\Column|Collection menu_id(string $label = null)
     * @method Grid\Column|Collection username(string $label = null)
     * @method Grid\Column|Collection password(string $label = null)
     * @method Grid\Column|Collection avatar(string $label = null)
     * @method Grid\Column|Collection remember_token(string $label = null)
     * @method Grid\Column|Collection type_id(string $label = null)
     * @method Grid\Column|Collection order(string $label = null)
     * @method Grid\Column|Collection parent_code(string $label = null)
     * @method Grid\Column|Collection area_code(string $label = null)
     * @method Grid\Column|Collection zip_code(string $label = null)
     * @method Grid\Column|Collection city_code(string $label = null)
     * @method Grid\Column|Collection short_name(string $label = null)
     * @method Grid\Column|Collection merger_name(string $label = null)
     * @method Grid\Column|Collection pinyin(string $label = null)
     * @method Grid\Column|Collection lng(string $label = null)
     * @method Grid\Column|Collection lat(string $label = null)
     * @method Grid\Column|Collection user_id(string $label = null)
     * @method Grid\Column|Collection version(string $label = null)
     * @method Grid\Column|Collection detail(string $label = null)
     * @method Grid\Column|Collection slug(string $label = null)
     * @method Grid\Column|Collection permission_id(string $label = null)
     * @method Grid\Column|Collection is_enabled(string $label = null)
     * @method Grid\Column|Collection content(string $label = null)
     * @method Grid\Column|Collection email(string $label = null)
     * @method Grid\Column|Collection email_verified_at(string $label = null)
     * @method Grid\Column|Collection uuid(string $label = null)
     * @method Grid\Column|Collection connection(string $label = null)
     * @method Grid\Column|Collection queue(string $label = null)
     * @method Grid\Column|Collection payload(string $label = null)
     * @method Grid\Column|Collection exception(string $label = null)
     * @method Grid\Column|Collection failed_at(string $label = null)
     * @method Grid\Column|Collection parent_id(string $label = null)
     * @method Grid\Column|Collection image(string $label = null)
     * @method Grid\Column|Collection subtitle(string $label = null)
     * @method Grid\Column|Collection category_id(string $label = null)
     * @method Grid\Column|Collection appid(string $label = null)
     * @method Grid\Column|Collection url(string $label = null)
     * @method Grid\Column|Collection flag(string $label = null)
     * @method Grid\Column|Collection desc(string $label = null)
     * @method Grid\Column|Collection channel_id(string $label = null)
     * @method Grid\Column|Collection pin_id(string $label = null)
     * @method Grid\Column|Collection start_at(string $label = null)
     * @method Grid\Column|Collection end_at(string $label = null)
     * @method Grid\Column|Collection category_ids(string $label = null)
     * @method Grid\Column|Collection switch(string $label = null)
     * @method Grid\Column|Collection path(string $label = null)
     * @method Grid\Column|Collection method(string $label = null)
     * @method Grid\Column|Collection ip(string $label = null)
     * @method Grid\Column|Collection input(string $label = null)
     * @method Grid\Column|Collection token(string $label = null)
     * @method Grid\Column|Collection icon(string $label = null)
     * @method Grid\Column|Collection uri(string $label = null)
     * @method Grid\Column|Collection extension(string $label = null)
     * @method Grid\Column|Collection target(string $label = null)
     * @method Grid\Column|Collection platform_id(string $label = null)
     * @method Grid\Column|Collection app_id(string $label = null)
     * @method Grid\Column|Collection app_secret(string $label = null)
     * @method Grid\Column|Collection http_method(string $label = null)
     * @method Grid\Column|Collection http_path(string $label = null)
     */
    class Grid {}

    class MiniGrid extends Grid {}

    /**
     * @property Show\Field|Collection status
     * @property Show\Field|Collection from
     * @property Show\Field|Collection top
     * @property Show\Field|Collection type
     * @property Show\Field|Collection level
     * @property Show\Field|Collection is_default
     * @property Show\Field|Collection auth
     * @property Show\Field|Collection id
     * @property Show\Field|Collection name
     * @property Show\Field|Collection key
     * @property Show\Field|Collection value
     * @property Show\Field|Collection remark
     * @property Show\Field|Collection created_at
     * @property Show\Field|Collection updated_at
     * @property Show\Field|Collection role_id
     * @property Show\Field|Collection menu_id
     * @property Show\Field|Collection username
     * @property Show\Field|Collection password
     * @property Show\Field|Collection avatar
     * @property Show\Field|Collection remember_token
     * @property Show\Field|Collection type_id
     * @property Show\Field|Collection order
     * @property Show\Field|Collection parent_code
     * @property Show\Field|Collection area_code
     * @property Show\Field|Collection zip_code
     * @property Show\Field|Collection city_code
     * @property Show\Field|Collection short_name
     * @property Show\Field|Collection merger_name
     * @property Show\Field|Collection pinyin
     * @property Show\Field|Collection lng
     * @property Show\Field|Collection lat
     * @property Show\Field|Collection user_id
     * @property Show\Field|Collection version
     * @property Show\Field|Collection detail
     * @property Show\Field|Collection slug
     * @property Show\Field|Collection permission_id
     * @property Show\Field|Collection is_enabled
     * @property Show\Field|Collection content
     * @property Show\Field|Collection email
     * @property Show\Field|Collection email_verified_at
     * @property Show\Field|Collection uuid
     * @property Show\Field|Collection connection
     * @property Show\Field|Collection queue
     * @property Show\Field|Collection payload
     * @property Show\Field|Collection exception
     * @property Show\Field|Collection failed_at
     * @property Show\Field|Collection parent_id
     * @property Show\Field|Collection image
     * @property Show\Field|Collection subtitle
     * @property Show\Field|Collection category_id
     * @property Show\Field|Collection appid
     * @property Show\Field|Collection url
     * @property Show\Field|Collection flag
     * @property Show\Field|Collection desc
     * @property Show\Field|Collection channel_id
     * @property Show\Field|Collection pin_id
     * @property Show\Field|Collection start_at
     * @property Show\Field|Collection end_at
     * @property Show\Field|Collection category_ids
     * @property Show\Field|Collection switch
     * @property Show\Field|Collection path
     * @property Show\Field|Collection method
     * @property Show\Field|Collection ip
     * @property Show\Field|Collection input
     * @property Show\Field|Collection token
     * @property Show\Field|Collection icon
     * @property Show\Field|Collection uri
     * @property Show\Field|Collection extension
     * @property Show\Field|Collection target
     * @property Show\Field|Collection platform_id
     * @property Show\Field|Collection app_id
     * @property Show\Field|Collection app_secret
     * @property Show\Field|Collection http_method
     * @property Show\Field|Collection http_path
     *
     * @method Show\Field|Collection status(string $label = null)
     * @method Show\Field|Collection from(string $label = null)
     * @method Show\Field|Collection top(string $label = null)
     * @method Show\Field|Collection type(string $label = null)
     * @method Show\Field|Collection level(string $label = null)
     * @method Show\Field|Collection is_default(string $label = null)
     * @method Show\Field|Collection auth(string $label = null)
     * @method Show\Field|Collection id(string $label = null)
     * @method Show\Field|Collection name(string $label = null)
     * @method Show\Field|Collection key(string $label = null)
     * @method Show\Field|Collection value(string $label = null)
     * @method Show\Field|Collection remark(string $label = null)
     * @method Show\Field|Collection created_at(string $label = null)
     * @method Show\Field|Collection updated_at(string $label = null)
     * @method Show\Field|Collection role_id(string $label = null)
     * @method Show\Field|Collection menu_id(string $label = null)
     * @method Show\Field|Collection username(string $label = null)
     * @method Show\Field|Collection password(string $label = null)
     * @method Show\Field|Collection avatar(string $label = null)
     * @method Show\Field|Collection remember_token(string $label = null)
     * @method Show\Field|Collection type_id(string $label = null)
     * @method Show\Field|Collection order(string $label = null)
     * @method Show\Field|Collection parent_code(string $label = null)
     * @method Show\Field|Collection area_code(string $label = null)
     * @method Show\Field|Collection zip_code(string $label = null)
     * @method Show\Field|Collection city_code(string $label = null)
     * @method Show\Field|Collection short_name(string $label = null)
     * @method Show\Field|Collection merger_name(string $label = null)
     * @method Show\Field|Collection pinyin(string $label = null)
     * @method Show\Field|Collection lng(string $label = null)
     * @method Show\Field|Collection lat(string $label = null)
     * @method Show\Field|Collection user_id(string $label = null)
     * @method Show\Field|Collection version(string $label = null)
     * @method Show\Field|Collection detail(string $label = null)
     * @method Show\Field|Collection slug(string $label = null)
     * @method Show\Field|Collection permission_id(string $label = null)
     * @method Show\Field|Collection is_enabled(string $label = null)
     * @method Show\Field|Collection content(string $label = null)
     * @method Show\Field|Collection email(string $label = null)
     * @method Show\Field|Collection email_verified_at(string $label = null)
     * @method Show\Field|Collection uuid(string $label = null)
     * @method Show\Field|Collection connection(string $label = null)
     * @method Show\Field|Collection queue(string $label = null)
     * @method Show\Field|Collection payload(string $label = null)
     * @method Show\Field|Collection exception(string $label = null)
     * @method Show\Field|Collection failed_at(string $label = null)
     * @method Show\Field|Collection parent_id(string $label = null)
     * @method Show\Field|Collection image(string $label = null)
     * @method Show\Field|Collection subtitle(string $label = null)
     * @method Show\Field|Collection category_id(string $label = null)
     * @method Show\Field|Collection appid(string $label = null)
     * @method Show\Field|Collection url(string $label = null)
     * @method Show\Field|Collection flag(string $label = null)
     * @method Show\Field|Collection desc(string $label = null)
     * @method Show\Field|Collection channel_id(string $label = null)
     * @method Show\Field|Collection pin_id(string $label = null)
     * @method Show\Field|Collection start_at(string $label = null)
     * @method Show\Field|Collection end_at(string $label = null)
     * @method Show\Field|Collection category_ids(string $label = null)
     * @method Show\Field|Collection switch(string $label = null)
     * @method Show\Field|Collection path(string $label = null)
     * @method Show\Field|Collection method(string $label = null)
     * @method Show\Field|Collection ip(string $label = null)
     * @method Show\Field|Collection input(string $label = null)
     * @method Show\Field|Collection token(string $label = null)
     * @method Show\Field|Collection icon(string $label = null)
     * @method Show\Field|Collection uri(string $label = null)
     * @method Show\Field|Collection extension(string $label = null)
     * @method Show\Field|Collection target(string $label = null)
     * @method Show\Field|Collection platform_id(string $label = null)
     * @method Show\Field|Collection app_id(string $label = null)
     * @method Show\Field|Collection app_secret(string $label = null)
     * @method Show\Field|Collection http_method(string $label = null)
     * @method Show\Field|Collection http_path(string $label = null)
     */
    class Show {}

    /**
     
     */
    class Form {}

}

namespace Dcat\Admin\Grid {
    /**
     
     */
    class Column {}

    /**
     
     */
    class Filter {}
}

namespace Dcat\Admin\Show {
    /**
     
     */
    class Field {}
}
