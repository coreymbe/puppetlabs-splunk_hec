# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [Unreleased](https://github.com/puppetlabs/puppetlabs-splunk_hec)

[Current Diff](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v2.1.0..main)

## [2.1.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v2.1.0) (2025-06-03)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v2.0.1..v2.1.0)

### Fixed

-  System metrics are now formatted with the metric name as the key and the metric value as the value. [#220](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/220)

## [2.0.1](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v2.0.1) (2024-11-26)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v2.0.0..v2.0.1)

### Fixed

-  Ensure the report processor is using the correct file to retrieve the token value. [#217](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/217)

## [2.0.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v2.0.0) (2024-3-27)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v1.4.0..v2.0.0)

### Added

- New parameters `token_events` and `url_events` can now be used to store events from `pe_event_forwarding` in a different index. [#212](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/212)

- The parameter `ignore_system_cert_store` is now named `include_system_cert_store` and defaults to **false**. [#208](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/208)

- Credential data provided to this module is now written to a separate configuration file utilizing the Sensitive data type to ensure redaction from Puppet logs and reports. [#204](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/204)

- Configuration files created by this module are now placed in a `splunk_hec` subdirectory. [#204](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/204)

- New private subclass `splunk_hec::v2_cleanup` ensures old configuration files are removed. [#204](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/204)

- New custom function to convert sensitive user provided data from a String to Puppet's [Sensitive](https://www.puppet.com/docs/puppet/latest/lang_data_sensitive.html) data type. [#203](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/203)

- Add support for Puppet 8. [#200](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/200)

### Removed

- The deprecated `reports` parameter has been removed in favor of having the module automatically add the **splunk_hec** setting to `puppet.conf`. [#212](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/212)

### Fixed

- Bug fix preventing `sar` metrics collected by `puppet_metrics_collector::system` from being shipped to Splunk. [#214](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/214)

- Removed logic preventing `job_id` and `code_id` from being added to report data. [#213](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/213)

- The `collect_facts` parameter has been renamed to `facts_allowlist` to align with the `facts_blocklist` parameter. [#212](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/212)

- No longer utilizing `parse_legacy_metrics` function for metrics collected with older versions of `puppet_metrics_collector`. [#211](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/211)

- False positive when attempting to rescue required facts from an unconfigured  `splunk_hec::facts_blocklist`. [#210](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/210)

- Settings are now removed from `puppet.conf` when `splunk_hec::disabled` is set to **true**. [#205](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/205)

## [v1.4.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.4.0) (2023-4-17)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v1.3.0..v1.4.0)

### Fixed

- Event filtering for `pe-console` and `code-manager` events are no longer ignored. [#196](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/196)

## [v1.3.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.3.0) (2022-4-27)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v1.2.1..v1.3.0)

### Added

- Added PE LTS version to testing matrix. [#185](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/185)

- SSL config options for FIPS. [#186](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/186)

- Ability to send reports that only contain changes. [#187](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/187)

### Fixed

- Rescue required facts that have been added to the block list. [#188](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/188)

## [v1.2.1](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.2.1) (2022-3-14)

### Added

- Allow rbac events to be disabled. [#179](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/179)

### Fixed

- Allow customer confdirs when using with pe_event_forwarding [#180](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/180)

- Fix syntax error when ssl is enabled. [#181](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/181)

## [v1.2.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.2.0) (2022-2-16)

### Added

- Ability to collect all facts against a blocklist. [#170](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/170)

### Fixed

- Prevent the `event_types` parameter from being configured unless `events_reporting_enabled` is set to **true**. [#174](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/174)

- The `splunk_hec_agent_only_node` fact now properly resolves to **false** on infrastructure nodes running Puppet Server. [#175](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/175)

- Prevent the deprecated `reports` parameter from removing configured settings in `puppet.conf`. [#176](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/176)

## [v1.1.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.1.0) (2021-11-09)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v1.0.1..v1.1.0)

### Added

- Forwarding from Non Puppet Server nodes. [#154](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/154)
- Filtering of event types data. [#156](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/156)
- FIPS Compatability [#159](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/159)

## [v1.0.1](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.0.1) (2021-10-04)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v1.0.0..v1.0.1)

### Fixed

- Removed hardcoded certname in util_splunk_hec template. [#149](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/149)
- Updated sourcetype from common_events to pe_event_forwarding in util_splunk_hec template. [#149](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/149)

### Added

- Added `event_types` parameter to limit the event types sent to Splunk. [#152](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/152)

## [v1.0.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v1.0.0) (2021-09-29)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.10.0...v1.0.0)

### Added

- Event Forwarding Processor to handle events from PE Event Fowarding. [#142](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/142)

## [v0.10.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.10.0) (2021-08-23)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.9.2...v0.10.0)

### Added

- Ignore System CA Certificate Store. [#137](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/137)

## [v0.9.2](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.9.2) (2021-08-02)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.9.1...v0.9.2)

### Fixed

- Fixed sourcetypetime to allow metrics to be sent without issue. [#135](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/135)

- Module metadata now supports latest versions of Puppet and Puppets Metrics Collector

## [v0.9.1](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.9.1) (2021-07-07)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.9.0...v0.9.1)

### Fixed

- Timestamp now matches timestamp value in the console [#130](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/130)

## [v0.9.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.9.0) (2021-06-29)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.8.1...v0.9.0)

### Fixed

- Puppet open source compatibility [\#76](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/76) Thanks [@southalc](https://github.com/southalc)

- Deprecation warning only when report parameter defined [\#85](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/85)

### Added

- Added array resource format option [\#40](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/40)

- Added Puppet Alert Actions documentation to README.md [\#115](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/115) Thanks [@coreymbe](https://github.com/coreymbe)

- Added splunk_hec disabling feature [\#120](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/120)

### Changed

- Project issues URl changed in metadata to point to JIRA to create tickets instead of at github to create issues [\#62](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/62)

- Switch to the `pe_ini_subsetting` resource for adding the report processor setting [\#51](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/51)

### Deprecated

- 'report' setting is now dynamically calculated. [\#49](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/49)


## [v0.8.1](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.8.1) (2020-05-11)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.8.0...v0.8.1)

### Fixed

- Replace relative docs links with static links [\#45](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/45) ([gsparks](https://github.com/gsparks))

## [v0.8.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.8.0) (2020-05-07)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.7.1...v0.8.0)

### Fixed

- fix single quote issue in classifier [\#42](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/42) ([mrzarquon](https://github.com/mrzarquon))
- \(PIE-178\) Parse line-delimited JSON metrics [\#39](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/39) ([Sharpie](https://github.com/Sharpie))
- PIE-178 Multiple Metrics in stdin [\#36](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/36) ([mrzarquon](https://github.com/mrzarquon))

## [v0.7.1](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.7.1) (2019-07-01)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/v0.7.0...v0.7.1)

### Fixed

- Fixes metrics uploading on splunk\_hec application [\#30](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/30) ([mrzarquon](https://github.com/mrzarquon))

## [v0.7.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/v0.7.0) (2019-06-25)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/0.7.0...v0.7.0)

## [0.7.0](https://github.com/puppetlabs/puppetlabs-splunk_hec/tree/0.7.0) (2019-06-17)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-splunk_hec/compare/0.6.0...0.7.0)

### Added

- Setup for github-changelog-generator [\#21](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/21) ([HelenCampbell](https://github.com/HelenCampbell))

### Fixed

- Adds troubleshooting documentation [\#22](https://github.com/puppetlabs/puppetlabs-splunk_hec/pull/22) ([mrzarquon](https://github.com/mrzarquon))

## 0.6.0
(2019/06/13)

### Changed
- The splunk_hec module now supports customizing the `fact_terminus` and `facts_cache_terminus` names in the custom routes.yaml it deploys. If you are using a different facts_terminus (ie, not PuppetDB), you will want to set that parameter. Please note that this will come with a breaking change in functionality - Switches to the fact terminus cache setting via routes.yaml to ensure compatibility with CD4PE, see Fact Terminus Support for guides on how to change it.

## 0.5.0
(2019/06/11)

### Added
- Advanced configuration for puppet:summary, puppet:facts and puppet:metrics to allow for the support of multiple indexes
- Additional documentation updates
- Added support for individual sourcetype urls
- Added ability to define multiple hec tokens on a sourcetype basis
- Addition of basic acceptance testing using Litmus
- The module is now under the power of the PDK
- Addition of the `saved_report` flag for the splunk_hec application - Allows the user to test some of the splunk_hec functionality, submits the result directly to the splunk configuration
- Addition of the splunk_hec puppet face/app allowing for a cat json | puppet splunk_hec like workflow. The primary functionality of this code is to enable sending pe metrics data to Splunk using the current CS best practices for collecting the CS data.
- Major changes to module were done to enable the Fact Terminus:
  - util/splunk_hec.rb created for common access methods
  - consistent info and error handling for both reports and facts
  - performance profile support for Fact Terminus
  - Documentation updated with guide and default facts listed
  - Module updated to optionally manage reports setting in puppet.conf
  - Module updated to add new parameters and template values
  - Fact collection time added to puppet report processor
  - SSL handling and documentation improved

### Fixed
- Minor fixes to output dialog

### Changed
- url parameter now expects a full URI of https://servername:8088/services/collector

## 0.4.1

- A small maintenance release to fix some broken links in metadata

## 0.4.0

Initial release

* SSL checking of target Splunk HEC is possible
* Submits Puppet Summary report
* Tasks for Bolt Apply and Bolt Result included
* Example Plans for above included


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
