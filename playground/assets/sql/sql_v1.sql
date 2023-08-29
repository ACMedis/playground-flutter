CREATE TABLE city(
  id INTEGER PRIMARY KEY,
  name text,
  uf text,
  ddd integer,
  codeErp integer,
  active integer
);

CREATE TABLE bearer(
  id INTEGER PRIMARY KEY,
  description text,
  codeErp integer,
  active integer
);

CREATE TABLE occupation(
  id INTEGER PRIMARY KEY,
  description text,
  codeErp integer,
  active integer
);

CREATE TABLE sector(
  id INTEGER PRIMARY KEY,
  description text,
  codeErp integer,
  active integer
);

CREATE TABLE payment(
  id INTEGER PRIMARY KEY,
  description text,
  codeErp integer,
  active integer,
  number_parcel integer,
  with_entrance integer,
  form_payment integer,
  financial_charge real
);

CREATE TABLE deposit(
  id INTEGER PRIMARY KEY,
  description text,
  codeErp integer,
  active integer
);

CREATE TABLE branch(
    id INTEGER PRIMARY KEY,
    name text, 
    fantasy text, 
    address text, 
    address_number text,
    neighborhood text,
    phone text,
    cnpj text,
    state_registration text,
    cep text,
    codeErp integer,
    active integer,
    id_city integer,
    id_deposit integer
);

CREATE TABLE table_price(
    id INTEGER PRIMARY KEY,
    description text,
    codeErp integer,
    percentage_commission real,
    date_start text,
    date_end text,
    active integer,
    color_default text
);

CREATE TABLE group_product(
     id INTEGER PRIMARY KEY,
    description text, 
    codeErp integer, 
    active integer
);

CREATE TABLE subgroup_product(
    id INTEGER PRIMARY KEY,
    description text,
    codeErp integer,
    id_group integer,
    active integer
);

CREATE TABLE product(
  id INTEGER PRIMARY KEY,
  description text, 
  codeErp integer, 
  id_subgroup integer, 
  mark text, 
  active integer, 
  id_mark
);

CREATE TABLE product_unity(
     id INTEGER PRIMARY KEY,
    code_bars text,
    id_product integer,
    id_branch integer,
    description_unity text,
    unity_code integer,
    unity_default integer,
    packing_default integer,
    factor_conversion real,
    sale_fractional integer,
    active integer,
    unitysale_default integer
);

CREATE TABLE product_image(
    id INTEGER PRIMARY KEY,
    id_product integer, 
    codeErp integer, 
    image blob, 
    image_default integer
);

CREATE TABLE tableprice_item(
    id INTEGER PRIMARY KEY,
    id_tableprice integer,
    code_bars text,
    date_item text,
    price real,
    percentage_commission real,
    percentage_discount real,
    percentage_discountmax real,
    id_product integer
);

CREATE TABLE stock(
  id_product integer, 
  id_branch integer, 
  id_deposit integer, 
  amount real,
  PRIMARY KEY (id_product, id_branch, id_deposit)
);

CREATE TABLE client(
    document text PRIMARY KEY, 
    id integer, 
    codeErp integer, 
    corpore_name text, 
    fantasy_name text,
    address text,
    address_number text,
    neighborhood text,
    complement text,
    cep text,
    email text,
    phone text,
    phone_cell text,
    cnae text,
    obs text,
    id_city integer,
    serasa text,
    consumer_final integer,
    id_sector integer,
    id_occupation integer,
    id_payment integer,
    date_register text,
    situation text,
    type_client text,
    changed integer,
    active integer,
    rg text,
    date_birth text,
    state_registration text,
    municipal_registration text,
    excluded integer,
    id_bearer integer,
    contribute_icms integer,
    attended integer
);

CREATE TABLE client_contact(
    document text, 
    sequence integer, 
    name text, 
    function_contact text, 
    email text, 
    type_contact text, 
    phone text, 
    phone_cell text, 
    receive_email integer,
    PRIMARY KEY (document, sequence)
);

CREATE TABLE sale_order(
  number_order integer PRIMARY KEY, 
        id_order integer, 
        id_branch integer,
        name_branch text,
        id_deposit integer,
        id_client integer,
        document_client text,
        name_client text,
        id_bearer integer,
        name_bearer text,
        id_payment integer,
        name_payment text,
        id_tableprice integer,
        name_tableprice text,
        data_register text,
        type_freight text,
        product_value real,
        discount_value real,
        discount_percent real,
        value_st real,
        value_ipi real,
        total_order real,
        purchase_order text,
        obs_order text,
        obs_nf text,
        date_delivery text,
        name_buyer text,
        freight_value real,
        time_register text,
        situaction text,
        sender_email integer,
        type_order text,
        status_order text
);

CREATE TABLE sale_order_item(
  number_order	integer,
    sequence integer,
    id_product	integer,
    name_product	text,
    id_deposit	integer,
    name_deposit	text,
    bar_code	text,
    description_unity	text,
    code_unity	integer,
    conversion_factor	real,
    id_tableprice	integer,
    name_tableprice	text,
    percent_commission	real,
    percent_discount	real,
    percent_descmax	real,
    pmc	real,
    amount	real,
    unity_value	real,
    discount_value	real,
    total	real,
    obs	text,
    tableprice_value	real,
    addition_value	real,
    id_branchorder	integer,
    value_commission	real DEFAULT 0,
    origin_discount	text DEFAULT '',
    type_discount_rule	text DEFAULT '',
    value_discount_rule	real,
    PRIMARY KEY(number_order, sequence) 
);

CREATE TABLE route_client(
  id INTEGER PRIMARY KEY,
  description text, 
        codeErp integer,
        active integer
);

CREATE TABLE reasonnotselling(
  id INTEGER PRIMARY KEY,
  description text,
        codeErp integer,
        active integer
);

CREATE TABLE route_visit(
        id_route integer,
        document text,
        id_seller integer,
        id_client integer,
        sequence integer,
        active integer,
        changed integer,
        PRIMARY KEY (id_route, document)
);

CREATE TABLE visit_seller(
  id INTEGER PRIMARY KEY,
  id_seller integer,
        id_route integer,
        sequence_route integer,
        id_client integer,
        date_visit text,
        time_visit text,
        id_reasonnotselling integer,
        obs text,
        synchronized integer
);

CREATE TABLE title_receive(
  id INTEGER PRIMARY KEY,
  id_client integer,
    date_release text,
    bearer_description text,
    title_number text,
    parcel_number text,
    date_due text,
    title_value real,
    balance real
);

CREATE TABLE mix_client (
    id	integer NOT NULL,
    id_erp	integer,
    id_client integer,
    id_product integer,
    id_order_seller integer,
    date_seller text,
    amount real,
    price real,
    PRIMARY KEY(id)
);

CREATE TABLE seller_parameter (
    id integer, 
    name text, 
    value text, 
    PRIMARY KEY (id)
);

CREATE TABLE client_payment (
    id integer,
    id_client integer,
    id_payment integer,
    active integer
);

CREATE TABLE client_bearer (
    id integer,
    id_client integer,
    id_bearer integer,
    active integer
);

CREATE TABLE client_table_price (  
    document text,
    id_table integer,
    PRIMARY KEY (document, id_table)
);

CREATE TABLE geo_location (
    id	text NOT NULL,
    latitude	text,
    longitude	text,
    obs	text,
    id_seller	integer,
    id_branch	integer,
    document	text,
    type_geo	text,
    total_order	real,
    date_time_register	text,
    sync	integer,
    order_number	integer,
    PRIMARY KEY(id)
);

CREATE TABLE mark (
    id	integer NOT NULL,
    description	text undefined,
    codeErp	integer undefined,
    active	integer undefined,
    PRIMARY KEY(id)
);

CREATE TABLE receivement_client (
    id	text NOT NULL,
    id_client	integer,
    date_lcto	text,
    value_lcto	real,
    obs	text,
    synchronize	integer,
    PRIMARY KEY(id)
);

CREATE TABLE rule_discount_group (
    id	text NOT NULL,
    id_group	integer,
    sequence	integer,
    amount	real,
    percent	real,
    value	real,
    synchronize	integer,
    active integer DEFAULT 1,
    PRIMARY KEY(id)
);

CREATE TABLE rule_discount_product (
    id	text NOT NULL,
    id_product	integer,
    sequence	integer,
    amount	real,
    percent	real,
    value	real,
    synchronize	integer,
    active	integer DEFAULT 1,
    PRIMARY KEY(id)
);

CREATE TABLE tableprice_payment (
    id	text NOT NULL,
    id_tableprice	integer,
    id_payment	integer,
    PRIMARY KEY(id)
);

CREATE TABLE tableprice_deposit (
    id	integer NOT NULL,
    id_tableprice	integer,
    id_deposit	integer,
    excluded	integer,
    PRIMARY KEY(id)
);

