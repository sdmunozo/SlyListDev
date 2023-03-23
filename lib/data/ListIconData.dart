import 'package:flutter/material.dart';

final iconMap = {
  'home': Icons.home,
  'cleaning_services': Icons.cleaning_services,
  'pool': Icons.pool,
  'local_florist': Icons.local_florist,
  'clean_hands': Icons.clean_hands,
  'fireplace': Icons.fireplace,
  'ac_unit': Icons.ac_unit,
  'settings': Icons.settings,
  'lock': Icons.lock,
  'bolt': Icons.bolt,
  'security': Icons.security,
  'camera_alt': Icons.camera_alt,
  'speaker': Icons.speaker,
  'lightbulb': Icons.lightbulb,
  'home_repair_service': Icons.home_repair_service,
  'water_damage': Icons.water_damage,
  'construction': Icons.construction,
  'fence': Icons.fence,
  'bathtub': Icons.bathtub,
  'kitchen': Icons.kitchen,
  'room': Icons.room,
  'bed': Icons.bed,
  'garden': Icons.park,
  'storage': Icons.storage,
  'move_to_inbox': Icons.move_to_inbox,
  'pets': Icons.pets,
  'sports_handball': Icons.sports_handball,
  'euro': Icons.euro,
  'school': Icons.school,
  'translate': Icons.translate,
  'menu_book': Icons.menu_book,
  'spa': Icons.spa,
  'watch': Icons.watch,
  'computer': Icons.computer,
  'public': Icons.public,
  'account_balance': Icons.account_balance,
  'favorite': Icons.favorite,
  'category': Icons.category,
  'fitness_center': Icons.fitness_center,
  'local_dining': Icons.local_dining,
  'healing': Icons.healing,
  'spa_outlined': Icons.spa_outlined,
  'weekend': Icons.weekend,
  'face': Icons.face,
  'directions_run': Icons.directions_run,
  'sports_mma': Icons.sports_mma,
  'build_circle': Icons.build_circle,
  'record_voice_over': Icons.record_voice_over,
  'psychology': Icons.psychology,
  'attach_money': Icons.attach_money,
  'gavel': Icons.gavel,
  'event': Icons.event,
  'home_work': Icons.home_work,
  'card_giftcard': Icons.card_giftcard,
  'child_friendly': Icons.child_friendly,
  'directions_car': Icons.directions_car,
  'directions_bike': Icons.directions_bike,
  'shopping_bag': Icons.shopping_bag,
  'camera': Icons.camera,
  'edit': Icons.edit,
  'music_note': Icons.music_note,
  'audiotrack': Icons.audiotrack,
  'devices': Icons.devices,
  'settings_input_component': Icons.settings_input_component,
  'healing_outlined': Icons.healing_outlined,
  'weekend_outlined': Icons.weekend_outlined,
  'build_circle_outlined': Icons.build_circle_outlined,
  'psychology_outlined': Icons.psychology_outlined,
  'event_outlined': Icons.event_outlined,
  'menu_book_outlined': Icons.menu_book_outlined,
  'school_outlined': Icons.school_outlined,
  'attach_money_outlined': Icons.attach_money_outlined,
  'translate_outlined': Icons.translate_outlined,
  'fitness': Icons.fitness_center,
  'yoga': Icons.self_improvement,
  'nutrition': Icons.food_bank,
  'physical_therapy': Icons.healing,
  'massage': Icons.spa,
  'beauty': Icons.face,
  'hair_styling': Icons.sports_bar,
  'manicure_pedicure': Icons.spa_outlined,
  'makeup': Icons.create,
  'martial_arts': Icons.masks,
  'self_defense': Icons.shield,
  'occupational_therapy': Icons.accessibility_new,
  'speech_therapy': Icons.record_voice_over,
  'financial_advice': Icons.monetization_on,
  'legal_advice': Icons.gavel,
  'tutoring': Icons.school,
  'career_consulting': Icons.work,
  'translation': Icons.translate,
  'event_planning': Icons.event,
  'home_organization': Icons.format_shapes,
  'travel_planning': Icons.flight,
  'personal_assistance': Icons.assistant,
  'pet_care': Icons.pets,
  'personal_transportation': Icons.directions_car,
  'housekeeping': Icons.cleaning_services,
  'landscaping': Icons.nature,
  'car_repair': Icons.build,
  'personal_shopping': Icons.shopping_cart,
  'interior_design': Icons.palette,
  'photography': Icons.camera_alt,
  'graphic_design': Icons.graphic_eq,
  'music_services': Icons.music_note,
  'audio_visual_equipment_rental': Icons.videocam,
  'electronics_repair': Icons.phonelink,
  'electronics_installation': Icons.settings_input_antenna,
  'electronics_cleaning': Icons.tv,
  'furniture_repair': Icons.handyman,
  'furniture_installation': Icons.add_to_home_screen,
  'jewelry_watch_repair': Icons.watch,
  'shoe_repair': Icons.fastfood,
  'personal_fashion_advice': Icons.style,
  'personal_branding_advice': Icons.branding_watermark,
  'website_design': Icons.web,
  'technology_advice': Icons.devices,
  'computer_repair': Icons.computer,
  'digital_skills_training': Icons.lightbulb,
  'social_media_management': Icons.social_distance,
  'content_writing_editing': Icons.edit,
  'seo_consulting': Icons.search,
  'business_strategy_consulting': Icons.leaderboard,
  'accounting_finance': Icons.account_balance,
  'project_management': Icons.account_tree,
  'executive_coaching': Icons.group_work,
  'human_resources_consulting': Icons.people,
  'technical_document_translation': Icons.science,
  'risk_management_consulting': Icons.warning,
  'data_analysis_statistics': Icons.assessment,
  'product_design_prototyping': Icons.design_services,
  '3d_printing_modeling': Icons.format_shapes,
  'multimedia_content_creation_management': Icons.multitrack_audio,
  'affiliate_marketing_online_advertising': Icons.thumb_up_alt,
  'lead_generation_sales': Icons.monetization_on,
  'software_programming_development': Icons.code,
  'personal_training': Icons.fitness_center,
  'yoga_pilates_meditation': Icons.self_improvement,
  'nutritional_advice': Icons.local_dining,
  'massage_therapy': Icons.spa,
  'skincare_beauty': Icons.face,
  'makeup_services': Icons.brush,
  'sports_training': Icons.fitness_center,
  'self_defense_training': Icons.security,
  'psychological_therapy': Icons.psychology,
  'personalized_tutoring': Icons.school,
  'career_employment_consulting': Icons.work,
  'translation_interpretation': Icons.language,
  'personal_assistance_childcare': Icons.child_friendly,
  'pet_care_services': Icons.pets,
  'personalized_transportation': Icons.directions_car,
  'house_cleaning': Icons.cleaning_services,
  'custom_landscaping': Icons.landscape,
  'personal_shopping_fashion_advice': Icons.shopping_cart,
  'interior_decorating': Icons.home,
  'custom_photography': Icons.camera_alt,
  'live_music_DJ_services': Icons.music_note,
  'audio_video_equipment_rental': Icons.videocam,
  'marketing_consulting': Icons.bar_chart,
  'custom_website_design': Icons.web,
  'technology_software_advice': Icons.computer,
  'computer_electronics_repair': Icons.computer,
  'computer_skills_training': Icons.computer,
  'SEO_digital_marketing_advice': Icons.search,
  'business_strategic_consulting': Icons.business,
  'accounting_finance_services': Icons.attach_money,
  'project_management_services': Icons.playlist_add_check,
  'human_resources_advice': Icons.people,
  '3D_printing_modeling': Icons.print,
  'mobile_game_design_development': Icons.games,
  'accessibility': Icons.accessibility,
  'account_box': Icons.account_box,
  'add': Icons.add,
  'add_circle': Icons.add_circle,
  'alarm': Icons.alarm,
  'assignment': Icons.assignment,
  'attach_file': Icons.attach_file,
  'build': Icons.build,
  'cached': Icons.cached,
  'call': Icons.call,
  'check': Icons.check,
  'cloud': Icons.cloud,
  'dashboard': Icons.dashboard,
  'delete': Icons.delete,
  'email': Icons.email,
  'feedback': Icons.feedback,
  'filter': Icons.filter,
  'flag': Icons.flag,
  'folder': Icons.folder,
  'help': Icons.help,
  'info': Icons.info,
  'label': Icons.label,
  'mail': Icons.mail,
  'menu': Icons.menu,
  'message': Icons.message,
  'notifications': Icons.notifications,
  'people': Icons.people,
  'person': Icons.person,
  'phone': Icons.phone,
  'print': Icons.print,
  'refresh': Icons.refresh,
  'save': Icons.save,
  'search': Icons.search,
  'send': Icons.send,
  'share': Icons.share,
  'star': Icons.star,
  'thumb_up': Icons.thumb_up,
  'today': Icons.today,
  'work': Icons.work,
  'table': Icons.table_chart,
  'television': Icons.tv,
  'trash_can': Icons.delete,
  'washing_machine': Icons.local_laundry_service,
  'window': Icons.view_module,
  'curtains': Icons.vertical_align_bottom,
  'blinds': Icons.view_stream,
  'rugs': Icons.layers,
  'shelves': Icons.library_books,
  'dresser': Icons.pages,
  'wardrobe': Icons.view_array,
  'nightstand': Icons.nights_stay,
  'greenhouse': Icons.eco,
  'grill': Icons.fireplace,
  'solar_panels': Icons.wb_sunny,
  'mailbox': Icons.mail_outline,
  'doorbell': Icons.notifications_active,
  'stairs': Icons.square_foot,
  'elevator': Icons.elevator,
  'ramp': Icons.rotate_right,
  'wheelchair_access': Icons.accessible,
  'intercom': Icons.voice_over_off,
  'fire_extinguisher': Icons.fire_extinguisher,
  'smoke_detector': Icons.smoke_free,
  'carbon_monoxide_detector': Icons.sensor_window,
  'security_system': Icons.security,
  'fire_alarm': Icons.warning_amber,
  'flood_sensor': Icons.sensors_off,
  'thermostat': Icons.thermostat,
  'ventilation': Icons.sync_alt,
  'air_purifier': Icons.filter_alt,
  'humidifier': Icons.water_damage,
  'dehumidifier': Icons.opacity,
  'ceiling_fan': Icons.rotate_right,
  'air_conditioner': Icons.ac_unit,
  'wifi_router': Icons.router,
  'network_switch': Icons.switch_left,
  'smart_plug': Icons.power,
  'speaker_system': Icons.speaker,
  'light_switch': Icons.toggle_on,
  'smart_light_bulb': Icons.lightbulb,
  'wall_socket': Icons.electrical_services,
  'smart_lock': Icons.lock_open,
  'garage_door_opener': Icons.garage,
  'garden_hose': Icons.precision_manufacturing,
  'weather_station': Icons.cloud,
  'lawn_mower': Icons.agriculture,
  'leaf_blower': Icons.filter_vintage,
  'snow_blower': Icons.ac_unit,
  'pressure_washer': Icons.water_damage,
  'weed_wacker': Icons.grass,
  'toolbox': Icons.construction,
  'bicycle': Icons.directions_bike,
  'scooter': Icons.electric_bike,
  'motorcycle': Icons.motorcycle,
  'boat': Icons.directions_boat,
  'car': Icons.directions_car,
  'rv': Icons.rv_hookup,
  'luggage': Icons.luggage,
  'gym_equipment': Icons.fitness_center,
  'musical_instruments': Icons.music_note,
  'painting_tools': Icons.brush,
  'sewing_machine': Icons.precision_manufacturing,
  'craft_supplies': Icons.color_lens,
  'art_supplies': Icons.palette,
  'office_supplies': Icons.business_center,
  'books': Icons.book,
  'board_games': Icons.sports_esports,
  'video_games': Icons.videogame_asset,
  'movie_collection': Icons.movie,
  'music_collection': Icons.album,
  'vinyl_records': Icons.album_outlined,
  'camera_equipment': Icons.camera,
  'drones': Icons.flight_takeoff,
  'power_tools': Icons.power,
  'hand_tools': Icons.build,
  'woodworking_tools': Icons.carpenter,
  'camping_equipment': Icons.nature_people,
  'sports_equipment': Icons.sports,
  'pool_table': Icons.sports_bar,
  'foosball_table': Icons.sports_soccer,
  'air_hockey': Icons.airplay,
  'ping_pong': Icons.sports_tennis,
  'dart_board': Icons.dangerous,
  'piano': Icons.piano,
  'drums': Icons.music_video,
  'microphone': Icons.mic,
  'dj_equipment': Icons.audiotrack,
  'room_service': Icons.room_service,
  'dining': Icons.dining,
  'bed': Icons.bed,
};
