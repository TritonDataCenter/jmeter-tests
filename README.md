# curly-rotary-phone
The sets of JMeter tests that QA uses to test manta buckets.

## Buckets.jmx - 
### Setup
  To run this test, fill out the property file. The default values should not work. To run this you will have to start JMeter with the -p <property_file> argument. 
### Description
 This is a general set of tests that will exercise the Manta Buckets API. Most of these tests use randomized valid data, and they mostly try to clean up after themselves. 
For the most part the names of the samples are verbose so one should be able to just log errors and the sampler name should give a clue to which test has failed.
The tests that are ran are documented in : https://docs.google.com/spreadsheets/d/1iz_SN2AQRCPe0GWAAnUrfW5dI9CWUCTn-cIjGeuAyyw/edit#gid=807845967


