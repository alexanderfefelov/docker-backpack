
    create table JIAccessEvent (
       id bigint not null auto_increment,
        user_id bigint not null,
        event_date datetime not null,
        resource_id bigint not null,
        updating bit not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIAwsDatasource (
       id bigint not null,
        accessKey varchar(150),
        secretKey varchar(255),
        roleARN varchar(100),
        region varchar(100) not null,
        dbName varchar(100) not null,
        dbInstanceIdentifier varchar(100) not null,
        dbService varchar(100) not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIAzureSqlDatasource (
       id bigint not null,
        keyStore_id bigint not null,
        keyStorePassword varchar(100),
        keyStoreType varchar(25),
        subscriptionId varchar(100),
        serverName varchar(100) not null,
        dbName varchar(100) not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIBeanDatasource (
       id bigint not null,
        beanName varchar(100) not null,
        beanMethod varchar(100),
        primary key (id)
    ) engine=InnoDB;

    create table JIContentResource (
       id bigint not null,
        data longblob,
        file_type varchar(20),
        primary key (id)
    ) engine=InnoDB;

    create table JICustomDatasource (
       id bigint not null,
        serviceClass varchar(250) not null,
        primary key (id)
    ) engine=InnoDB;

    create table JICustomDatasourceProperty (
       ds_id bigint not null,
        name varchar(200) not null,
        value varchar(1000),
        primary key (ds_id, name)
    ) engine=InnoDB;

    create table JICustomDatasourceResource (
       ds_id bigint not null,
        name varchar(200) not null,
        resource_id bigint not null,
        primary key (ds_id, name)
    ) engine=InnoDB;

    create table JIDataSnapshot (
       id bigint not null auto_increment,
        version integer not null,
        snapshot_date datetime,
        contents_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIDataSnapshotContents (
       id bigint not null auto_increment,
        data longblob not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIDataSnapshotParameter (
       id bigint not null,
        parameter_name varchar(100) not null,
        parameter_value longblob,
        primary key (id, parameter_name)
    ) engine=InnoDB;

    create table JIDataType (
       id bigint not null,
        type tinyint,
        maxLength integer,
        decimals integer,
        regularExpr varchar(255),
        minValue blob,
        max_value blob,
        strictMin bit,
        strictMax bit,
        primary key (id)
    ) engine=InnoDB;

    create table JIFileResource (
       id bigint not null,
        data longblob,
        file_type varchar(20),
        reference bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIFTPInfoProperties (
       repodest_id bigint not null,
        property_name varchar(100) not null,
        property_value varchar(250),
        primary key (repodest_id, property_name)
    ) engine=InnoDB;

    create table JIInputControl (
       id bigint not null,
        type tinyint,
        mandatory bit,
        readOnly bit,
        visible bit,
        data_type bigint,
        list_of_values bigint,
        list_query bigint,
        query_value_column varchar(200),
        defaultValue tinyblob,
        primary key (id)
    ) engine=InnoDB;

    create table JIInputControlQueryColumn (
       input_control_id bigint not null,
        column_index integer not null,
        query_column varchar(200) not null,
        primary key (input_control_id, column_index)
    ) engine=InnoDB;

    create table JIJdbcDatasource (
       id bigint not null,
        driver varchar(100) not null,
        password varchar(250),
        connectionUrl varchar(500),
        username varchar(100),
        timezone varchar(100),
        primary key (id)
    ) engine=InnoDB;

    create table JIJNDIJdbcDatasource (
       id bigint not null,
        jndiName varchar(100) not null,
        timezone varchar(100),
        primary key (id)
    ) engine=InnoDB;

    create table JIListOfValues (
       id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIListOfValuesItem (
       id bigint not null,
        idx integer not null,
        label varchar(255),
        value longblob,
        primary key (id, idx)
    ) engine=InnoDB;

    create table JILogEvent (
       id bigint not null auto_increment,
        occurrence_date datetime not null,
        event_type tinyint not null,
        component varchar(100),
        message varchar(250) not null,
        resource_uri varchar(250),
        event_text longtext,
        event_data longblob,
        event_state tinyint,
        userId bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIMondrianConnection (
       id bigint not null,
        reportDataSource bigint,
        mondrianSchema bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIMondrianXMLADefinition (
       id bigint not null,
        catalog varchar(100) not null,
        mondrianConnection bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIObjectPermission (
       id bigint not null auto_increment,
        uri varchar(1000) not null,
        recipientobjectclass varchar(250),
        recipientobjectid bigint,
        permissionMask integer not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIOlapClientConnection (
       id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIOlapUnit (
       id bigint not null,
        olapClientConnection bigint,
        mdx_query longtext not null,
        view_options longblob,
        primary key (id)
    ) engine=InnoDB;

    create table JIProfileAttribute (
       id bigint not null auto_increment,
        attrName varchar(255) not null,
        attrValue varchar(2000),
        description varchar(255),
        owner varchar(255),
        principalobjectclass varchar(255) not null,
        principalobjectid bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIQuery (
       id bigint not null,
        dataSource bigint,
        query_language varchar(40) not null,
        sql_query longtext not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportAlertToAddress (
       alert_id bigint not null,
        to_address_idx integer not null,
        to_address varchar(100) not null,
        primary key (alert_id, to_address_idx)
    ) engine=InnoDB;

    create table JIReportJob (
       id bigint not null auto_increment,
        version integer not null,
        owner bigint not null,
        label varchar(100) not null,
        description varchar(2000),
        creation_date datetime,
        report_unit_uri varchar(250) not null,
        scheduledResource bigint not null,
        job_trigger bigint not null,
        base_output_name varchar(100) not null,
        output_locale varchar(20),
        content_destination bigint,
        mail_notification bigint,
        alert bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportJobAlert (
       id bigint not null auto_increment,
        version integer not null,
        recipient tinyint not null,
        subject varchar(100),
        message_text varchar(2000),
        message_text_when_job_fails varchar(2000),
        job_state tinyint not null,
        including_stack_trace bit not null,
        including_report_job_info bit not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportJobCalendarTrigger (
       id bigint not null,
        minutes varchar(200) not null,
        hours varchar(80) not null,
        days_type tinyint not null,
        week_days varchar(20),
        month_days varchar(100),
        months varchar(40) not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportJobMail (
       id bigint not null auto_increment,
        version integer not null,
        subject varchar(100) not null,
        message varchar(2000),
        send_type tinyint not null,
        skip_empty bit not null,
        message_text_when_job_fails varchar(2000),
        inc_stktrc_when_job_fails bit not null,
        skip_notif_when_job_fails bit not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportJobMailRecipient (
       destination_id bigint not null,
        recipient_idx integer not null,
        recipient_type tinyint not null,
        address varchar(100) not null,
        primary key (destination_id, recipient_idx)
    ) engine=InnoDB;

    create table JIReportJobOutputFormat (
       report_job_id bigint not null,
        output_format tinyint not null,
        primary key (report_job_id, output_format)
    ) engine=InnoDB;

    create table JIReportJobParameter (
       job_id bigint not null,
        parameter_name varchar(255) not null,
        parameter_value longblob,
        primary key (job_id, parameter_name)
    ) engine=InnoDB;

    create table JIReportJobRepoDest (
       id bigint not null auto_increment,
        version integer not null,
        folder_uri varchar(250),
        sequential_filenames bit not null,
        overwrite_files bit not null,
        save_to_repository bit not null,
        output_description varchar(250),
        timestamp_pattern varchar(250),
        using_def_rpt_opt_folder_uri bit not null,
        output_local_folder varchar(250),
        user_name varchar(50),
        password varchar(250),
        server_name varchar(150),
        folder_path varchar(250),
        ssh_private_key bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportJobSimpleTrigger (
       id bigint not null,
        occurrence_count integer not null,
        recurrence_interval integer,
        recurrence_interval_unit tinyint,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportJobTrigger (
       id bigint not null auto_increment,
        version integer not null,
        timezone varchar(40),
        start_type tinyint not null,
        start_date datetime,
        end_date datetime,
        calendar_name varchar(50),
        misfire_instruction integer not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportThumbnail (
       id bigint not null auto_increment,
        user_id bigint not null,
        resource_id bigint not null,
        thumbnail longblob not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportUnit (
       id bigint not null,
        reportDataSource bigint,
        query bigint,
        mainReport bigint,
        controlrenderer varchar(100),
        reportrenderer varchar(100),
        promptcontrols bit,
        controlslayout tinyint,
        data_snapshot_id bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIReportUnitInputControl (
       report_unit_id bigint not null,
        control_index integer not null,
        input_control_id bigint not null,
        primary key (report_unit_id, control_index)
    ) engine=InnoDB;

    create table JIReportUnitResource (
       report_unit_id bigint not null,
        resource_index integer not null,
        resource_id bigint not null,
        primary key (report_unit_id, resource_index)
    ) engine=InnoDB;

    create table JIRepositoryCache (
       id bigint not null auto_increment,
        uri varchar(250) not null,
        cache_name varchar(20) not null,
        data longblob,
        version integer not null,
        version_date datetime not null,
        item_reference bigint,
        primary key (id)
    ) engine=InnoDB;

    create table JIResource (
       id bigint not null auto_increment,
        version integer not null,
        name varchar(200) not null,
        parent_folder bigint not null,
        childrenFolder bigint,
        label varchar(200) not null,
        description varchar(250),
        resourceType varchar(255) not null,
        creation_date datetime not null,
        update_date datetime not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIResourceFolder (
       id bigint not null auto_increment,
        version integer not null,
        uri varchar(250) not null,
        hidden bit,
        name varchar(200) not null,
        label varchar(200) not null,
        description varchar(250),
        parent_folder bigint,
        creation_date datetime not null,
        update_date datetime not null,
        primary key (id)
    ) engine=InnoDB;

    create table JIRole (
       id bigint not null auto_increment,
        rolename varchar(100) not null,
        tenantId bigint not null,
        externallyDefined bit,
        primary key (id)
    ) engine=InnoDB;

    create table JITenant (
       id bigint not null auto_increment,
        tenantId varchar(100) not null,
        tenantAlias varchar(100) not null,
        parentId bigint,
        tenantName varchar(100) not null,
        tenantDesc varchar(250),
        tenantNote varchar(250),
        tenantUri varchar(250) not null,
        tenantFolderUri varchar(250) not null,
        theme varchar(250),
        primary key (id)
    ) engine=InnoDB;

    create table JIUser (
       id bigint not null auto_increment,
        username varchar(100) not null,
        tenantId bigint not null,
        fullname varchar(100) not null,
        emailAddress varchar(100),
        password varchar(250),
        externallyDefined bit,
        enabled bit,
        previousPasswordChangeTime datetime,
        primary key (id)
    ) engine=InnoDB;

    create table JIUserRole (
       roleId bigint not null,
        userId bigint not null,
        primary key (userId, roleId)
    ) engine=InnoDB;

    create table JIVirtualDatasource (
       id bigint not null,
        timezone varchar(100),
        primary key (id)
    ) engine=InnoDB;

    create table JIVirtualDataSourceUriMap (
       virtualDS_id bigint not null,
        data_source_name varchar(200) not null,
        resource_id bigint not null,
        primary key (virtualDS_id, data_source_name)
    ) engine=InnoDB;

    create table JIXMLAConnection (
       id bigint not null,
        catalog varchar(100) not null,
        username varchar(100) not null,
        password varchar(250) not null,
        datasource varchar(100) not null,
        uri varchar(100) not null,
        primary key (id)
    ) engine=InnoDB;
create index access_user_index on JIAccessEvent (user_id);
create index access_date_index on JIAccessEvent (event_date);
create index access_res_index on JIAccessEvent (resource_id);
create index access_upd_index on JIAccessEvent (updating);

    alter table JIReportThumbnail 
       add constraint UKby8mikd2bdxyvgguosocs0yn3 unique (user_id, resource_id);

    alter table JIRepositoryCache 
       add constraint UKt25kjcmwyu0v0jvmgj7jpe7fq unique (uri, cache_name);
create index resource_type_index on JIResource (resourceType);

    alter table JIResource 
       add constraint UKq0fsg83g1w6207k40fixjobra unique (name, parent_folder);

    alter table JIResourceFolder 
       add constraint UK_emu9w2irh08lh7kw07be7u1vp unique (uri);

    alter table JIRole 
       add constraint UKqrupjb1yd43e3t6po2nk038t9 unique (rolename, tenantId);

    alter table JITenant 
       add constraint UK1jv9e2tsi2vn74xivgia15g42 unique (tenantId);

    alter table JIUser 
       add constraint UKrw3wi1dqcub2iiom9pvdtuso unique (username, tenantId);

    alter table JIAccessEvent 
       add constraint FK7caj87u72rymu6805gtek03y8 
       foreign key (user_id) 
       references JIUser (id);

    alter table JIAccessEvent 
       add constraint FK8lqavxfshc29dnw97io0t6wbf 
       foreign key (resource_id) 
       references JIResource (id) 
       on delete cascade;

    alter table JIAwsDatasource 
       add constraint FKa2q6ho769d4h6k1inqfw0avbi 
       foreign key (id) 
       references JIJdbcDatasource (id);

    alter table JIAzureSqlDatasource 
       add constraint FKq54ak99008wuueewun6lw3x8p 
       foreign key (id) 
       references JIJdbcDatasource (id);

    alter table JIAzureSqlDatasource 
       add constraint FK88n34smbe9i5eiqyvts12427n 
       foreign key (keyStore_id) 
       references JIResource (id);

    alter table JIBeanDatasource 
       add constraint FKcq7pt3wmr5oua2omyaynj18wm 
       foreign key (id) 
       references JIResource (id);

    alter table JIContentResource 
       add constraint FKc903d1j62d6q2alfowyml1qyc 
       foreign key (id) 
       references JIResource (id);

    alter table JICustomDatasource 
       add constraint FK698qlo478w8q00ratagvxjigg 
       foreign key (id) 
       references JIResource (id);

    alter table JICustomDatasourceProperty 
       add constraint FKlmhvtq6f4aj7nbgpkop6pvwaj 
       foreign key (ds_id) 
       references JICustomDatasource (id);

    alter table JICustomDatasourceResource 
       add constraint FKdqu6gyndmi8barxd4e4mwgiu1 
       foreign key (resource_id) 
       references JIResource (id);

    alter table JICustomDatasourceResource 
       add constraint FK2b8of47ft9ucqg6wxq51d94f6 
       foreign key (ds_id) 
       references JICustomDatasource (id);

    alter table JIDataSnapshotParameter 
       add constraint id_fk_idx 
       foreign key (id) 
       references JIDataSnapshot (id);

    alter table JIDataType 
       add constraint FKfowvvrdpyr4fsfdt0qekb6b31 
       foreign key (id) 
       references JIResource (id);

    alter table JIFileResource 
       add constraint FK9cks6rnum2e1nwpltygmric0a 
       foreign key (id) 
       references JIResource (id);

    alter table JIFileResource 
       add constraint FK7lou06p9h4uewmjilbvtiyfti 
       foreign key (reference) 
       references JIFileResource (id);

    alter table JIFTPInfoProperties 
       add constraint FKs9ui25pnlkwvymdhafps0eqox 
       foreign key (repodest_id) 
       references JIReportJobRepoDest (id);

    alter table JIInputControl 
       add constraint FK7gw3h08vhv4ehuscnk22lweb0 
       foreign key (id) 
       references JIResource (id);

    alter table JIInputControl 
       add constraint FKidpnbmursposu1b72a37j99dg 
       foreign key (data_type) 
       references JIDataType (id);

    alter table JIInputControl 
       add constraint FK8igl58hkwa8csd2pptsj6sl48 
       foreign key (list_of_values) 
       references JIListOfValues (id);

    alter table JIInputControl 
       add constraint FKeji041b95gimh1lii27d3j66f 
       foreign key (list_query) 
       references JIQuery (id);

    alter table JIInputControlQueryColumn 
       add constraint FKawiyltd98xvdsp3syt7fllehw 
       foreign key (input_control_id) 
       references JIInputControl (id);

    alter table JIJdbcDatasource 
       add constraint FKkjuw9e7bu5n4k5nm3osifg5gc 
       foreign key (id) 
       references JIResource (id);

    alter table JIJNDIJdbcDatasource 
       add constraint FK2gd8opslbt6erc8yx74s6j0nw 
       foreign key (id) 
       references JIResource (id);

    alter table JIListOfValues 
       add constraint FKaoih4o3b0gmj4vgvocwb2m9qp 
       foreign key (id) 
       references JIResource (id);

    alter table JIListOfValuesItem 
       add constraint FK2eq5m33wjtmf3d61gp38aqq77 
       foreign key (id) 
       references JIListOfValues (id);

    alter table JILogEvent 
       add constraint FK7636lhqn8drpalfckmb5wlljb 
       foreign key (userId) 
       references JIUser (id);

    alter table JIMondrianConnection 
       add constraint FKm9glomusslw0ouy1xev0kafql 
       foreign key (id) 
       references JIOlapClientConnection (id);

    alter table JIMondrianConnection 
       add constraint FK8yiwytorg3lwqq1gag9fng7rf 
       foreign key (reportDataSource) 
       references JIResource (id);

    alter table JIMondrianConnection 
       add constraint FKamcjhut3kc0ko4rypemusdn7d 
       foreign key (mondrianSchema) 
       references JIFileResource (id);

    alter table JIMondrianXMLADefinition 
       add constraint FKclv0lm19k3nvkmbv41epbfs34 
       foreign key (id) 
       references JIResource (id);

    alter table JIMondrianXMLADefinition 
       add constraint FKnmn2j9pevf2slm0i314ghs1sq 
       foreign key (mondrianConnection) 
       references JIMondrianConnection (id);

    alter table JIOlapClientConnection 
       add constraint FKqtji02a7ga296baj2y3avol24 
       foreign key (id) 
       references JIResource (id);

    alter table JIOlapUnit 
       add constraint FKtj0u3bnnfbe2h6w5v9jue5xr1 
       foreign key (id) 
       references JIResource (id);

    alter table JIOlapUnit 
       add constraint FKakvumwho658vijmoaaxddp4xo 
       foreign key (olapClientConnection) 
       references JIOlapClientConnection (id);

    alter table JIQuery 
       add constraint FK1ql6x3q59eti9h2r042ogoj3i 
       foreign key (id) 
       references JIResource (id);

    alter table JIQuery 
       add constraint FK6ff8ikqrr2celf9wvfbrcycpx 
       foreign key (dataSource) 
       references JIResource (id);

    alter table JIReportAlertToAddress 
       add constraint FKhaqpdt65o66idbve7gs97ye8p 
       foreign key (alert_id) 
       references JIReportJobAlert (id);

    alter table JIReportJob 
       add constraint FKntl9s5ul4oy4k9ws8u5wer55w 
       foreign key (owner) 
       references JIUser (id);

    alter table JIReportJob 
       add constraint FKkclub0l9io38j4su6crr9amd8 
       foreign key (scheduledResource) 
       references JIResource (id);

    alter table JIReportJob 
       add constraint FK8ymdkrb9uvvyi3xw9padxdxdv 
       foreign key (job_trigger) 
       references JIReportJobTrigger (id);

    alter table JIReportJob 
       add constraint FKrbhjr4v64eym1mg2du3fs9i95 
       foreign key (content_destination) 
       references JIReportJobRepoDest (id);

    alter table JIReportJob 
       add constraint FKo8dw7hsyef0xa1vg9feiu1mea 
       foreign key (mail_notification) 
       references JIReportJobMail (id);

    alter table JIReportJob 
       add constraint FKgg6i9vqj6rx0kgqxmoqigm3gr 
       foreign key (alert) 
       references JIReportJobAlert (id);

    alter table JIReportJobCalendarTrigger 
       add constraint FK89c4gqc5f5myrmfrc9a5gw7vb 
       foreign key (id) 
       references JIReportJobTrigger (id);

    alter table JIReportJobMailRecipient 
       add constraint FKoe0v23mvul37f23piq39ks6fh 
       foreign key (destination_id) 
       references JIReportJobMail (id);

    alter table JIReportJobOutputFormat 
       add constraint FKi5f8ideliwcf9juic989pn2lj 
       foreign key (report_job_id) 
       references JIReportJob (id);

    alter table JIReportJobParameter 
       add constraint FKh72kmrkm333g8ldlu7kybkrcd 
       foreign key (job_id) 
       references JIReportJob (id);

    alter table JIReportJobRepoDest 
       add constraint FKba2wg3iix8mr5wcjq6004ekvw 
       foreign key (ssh_private_key) 
       references JIResource (id);

    alter table JIReportJobSimpleTrigger 
       add constraint FK7gwgexkgjb6h4hn0166h2ttyk 
       foreign key (id) 
       references JIReportJobTrigger (id);

    alter table JIReportThumbnail 
       add constraint FKhcdwx2qpiib9xtract2ecv31 
       foreign key (user_id) 
       references JIUser (id) 
       on delete cascade;

    alter table JIReportThumbnail 
       add constraint FK8msuqfe2w3o9qjo81g8i6mgpi 
       foreign key (resource_id) 
       references JIResource (id) 
       on delete cascade;

    alter table JIReportUnit 
       add constraint FK6cl7eluds59jg1emjofa30i23 
       foreign key (id) 
       references JIResource (id);

    alter table JIReportUnit 
       add constraint FK88u05b8n58ciemd3qcrd1jxn 
       foreign key (reportDataSource) 
       references JIResource (id);

    alter table JIReportUnit 
       add constraint FKcenakwnolc02r8xbdio30du9h 
       foreign key (query) 
       references JIQuery (id);

    alter table JIReportUnit 
       add constraint FKi2qw1u7yutrxh03xkrgx9o37d 
       foreign key (mainReport) 
       references JIFileResource (id);

    alter table JIReportUnitInputControl 
       add constraint FK8i0f45gnyhwcfrgueufsrvaw1 
       foreign key (input_control_id) 
       references JIInputControl (id);

    alter table JIReportUnitInputControl 
       add constraint FKkvxewxu2tyomdsg1kioplnfq 
       foreign key (report_unit_id) 
       references JIReportUnit (id);

    alter table JIReportUnitResource 
       add constraint FK18lcqhapddcvgcl52yqhil0a4 
       foreign key (resource_id) 
       references JIFileResource (id);

    alter table JIReportUnitResource 
       add constraint FK2fjktehjwog75dmp2rrfgm958 
       foreign key (report_unit_id) 
       references JIReportUnit (id);

    alter table JIRepositoryCache 
       add constraint FKah8ma0bnkbirohud6lvenjt0k 
       foreign key (item_reference) 
       references JIRepositoryCache (id);

    alter table JIResource 
       add constraint FKtnvtjq7s7hviyarfmomkokjm4 
       foreign key (parent_folder) 
       references JIResourceFolder (id);

    alter table JIResource 
       add constraint FKc2qblpikow4ay35q0xgf9rjub 
       foreign key (childrenFolder) 
       references JIResourceFolder (id);

    alter table JIResourceFolder 
       add constraint FKduwulvl4qwqkqpxonyuer65fi 
       foreign key (parent_folder) 
       references JIResourceFolder (id);

    alter table JIRole 
       add constraint FKmrf25easnd1emk6juaeot4dkn 
       foreign key (tenantId) 
       references JITenant (id);

    alter table JITenant 
       add constraint FKqupdx83verq7860nxsd6l24y1 
       foreign key (parentId) 
       references JITenant (id);

    alter table JIUser 
       add constraint FKdnd0cy83h5cc2ex1375wek3wf 
       foreign key (tenantId) 
       references JITenant (id);

    alter table JIUserRole 
       add constraint FKrnaojg2v9yc6u72wrl6pmmi60 
       foreign key (userId) 
       references JIUser (id);

    alter table JIUserRole 
       add constraint FKska4g96yuc7dsyrskhot6nccp 
       foreign key (roleId) 
       references JIRole (id);

    alter table JIVirtualDatasource 
       add constraint FK8jua4kahyslb99ni7bbyjxdf6 
       foreign key (id) 
       references JIResource (id);

    alter table JIVirtualDataSourceUriMap 
       add constraint FKbpwmqrxy4onvvbsnole8icjic 
       foreign key (resource_id) 
       references JIResource (id);

    alter table JIVirtualDataSourceUriMap 
       add constraint FK94bfn67jetx6l0ykl2g9n37w1 
       foreign key (virtualDS_id) 
       references JIVirtualDatasource (id);

    alter table JIXMLAConnection 
       add constraint FK27s5ja8sxgrylp7cf0wyscl79 
       foreign key (id) 
       references JIOlapClientConnection (id);
create index idx26_mail_notification_idx on JIReportJob (mail_notification);
create index JIReportUnit_query_index on JIReportUnit (query);
create index JIReportJob_owner_index on JIReportJob (owner);
create index idx29_reportDataSource_idx on JIReportUnit (reportDataSource);
create index idx25_content_destination_idx on JIReportJob (content_destination);
create index idx28_resource_id_idx on JIReportThumbnail (resource_id);
create index JIReportJob_job_trigger_index on JIReportJob (job_trigger);
create index JIReportUnit_mainReport_index on JIReportUnit (mainReport);
create index idx14_repodest_id_idx on JIFTPInfoProperties (repodest_id);
create index idx32_report_unit_id_idx on JIReportUnitResource (report_unit_id);
create index idx34_item_reference_idx on JIRepositoryCache (item_reference);
create index idx24_alert_id_idx on JIReportAlertToAddress (alert_id);
create index idx30_input_ctrl_id_idx on JIReportUnitInputControl (input_control_id);
create index idx27_destination_id_idx on JIReportJobMailRecipient (destination_id);
create index idx31_report_unit_id_idx on JIReportUnitInputControl (report_unit_id);
create index JITenant_parentId_index on JITenant (parentId);
create index idx23_olapClientConnection_idx on JIOlapUnit (olapClientConnection);
create index JIReportJob_alert_index on JIReportJob (alert);
create index JIQuery_dataSource_index on JIQuery (dataSource);
create index JIUser_tenantId_index on JIUser (tenantId);
create index idx20_mondrianConnection_idx on JIMondrianXMLADefinition (mondrianConnection);
create index idxA1_resource_id_idx on JICustomDatasourceResource (resource_id);
create index JIInputControl_data_type_index on JIInputControl (data_type);
create index idx22_recipientobjid_idx on JIObjectPermission (recipientobjectid);
create index JIInputCtrl_list_of_values_idx on JIInputControl (list_of_values);
create index JIRole_tenantId_index on JIRole (tenantId);
create index JIResourceFolder_version_index on JIResourceFolder (version);
create index uri_index on JIObjectPermission (uri(255));
create index JIResourceFolder_hidden_index on JIResourceFolder (hidden);
create index idx21_recipientobjclass_idx on JIObjectPermission (recipientobjectclass);
create index idx16_mondrianSchema_idx on JIMondrianConnection (mondrianSchema);
create index idx17_reportDataSource_idx on JIMondrianConnection (reportDataSource);
create index JIInputControl_list_query_idx on JIInputControl (list_query);
create index JIUserRole_roleId_index on JIUserRole (roleId);
create index idx15_input_ctrl_id_idx on JIInputControlQueryColumn (input_control_id);
create index JIUserRole_userId_index on JIUserRole (userId);
create index JIFileResource_reference_index on JIFileResource (reference);
create index JIResource_parent_folder_index on JIResource (parent_folder);
create index idx35_parent_folder_idx on JIResourceFolder (parent_folder);
create index idx36_resource_id_idx on JIVirtualDataSourceUriMap (resource_id);
create index idx33_resource_id_idx on JIReportUnitResource (resource_id);
create index JIResource_childrenFolder_idx on JIResource (childrenFolder);
create index JILogEvent_userId_index on JILogEvent (userId);
