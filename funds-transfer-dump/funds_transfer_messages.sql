
Dump Messages Table
= = =

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: messages; Type: TABLE DATA; Schema: message_store; Owner: postgres
--

INSERT INTO message_store.messages VALUES (1, 0, '2023-03-03 20:27:07.029319', 'account:command-123', 'Deposit', '{"time": "2000-01-01T00:00:00.001Z", "amount": 11, "accountId": "123", "depositId": "59714c20-2c48-4e4f-beac-19eca95f3f36"}', NULL, 'd7d03f88-fc69-405b-b89c-0a1faf35b07c');
INSERT INTO message_store.messages VALUES (2, 0, '2023-03-03 20:27:07.047097', 'fundsTransfer:command-7a28081d-4adc-4207-8d7c-5f70aa423955', 'Transfer', '{"time": "2000-01-01T00:00:00.001Z", "amount": 11, "fundsTransferId": "7a28081d-4adc-4207-8d7c-5f70aa423955", "depositAccountId": "456", "withdrawalAccountId": "123"}', NULL, '92a2610e-a390-49c5-a32e-c9a4721cee0c');
INSERT INTO message_store.messages VALUES (3, 0, '2023-03-03 20:27:07.055199', 'accountTransaction-59714c20-2c48-4e4f-beac-19eca95f3f36', 'Deposit', '{"time": "2000-01-01T00:00:00.001Z", "amount": 11, "accountId": "123", "depositId": "59714c20-2c48-4e4f-beac-19eca95f3f36"}', '{"causationMessagePosition": 0, "causationMessageStreamName": "account:command-123", "causationMessageGlobalPosition": 1}', 'e0633c6a-ef0a-4954-a4e3-ed71f1c7dd6d');
INSERT INTO message_store.messages VALUES (4, 0, '2023-03-03 20:27:07.166739', 'fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955', 'Initiated', '{"time": "2000-01-01T00:00:00.001Z", "amount": 11, "depositId": "cd543c5b-7f0b-4a68-bb64-b229d5fca117", "withdrawalId": "df068de5-658c-4a1b-8ca1-b87b2be8b0e2", "processedTime": "2023-03-03T20:27:07.152Z", "fundsTransferId": "7a28081d-4adc-4207-8d7c-5f70aa423955", "depositAccountId": "456", "withdrawalAccountId": "123"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 0, "causationMessageStreamName": "fundsTransfer:command-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessageGlobalPosition": 2}', '5971a907-6dc8-492a-b2ee-2b6b69ad05b7');
INSERT INTO message_store.messages VALUES (5, 0, '2023-03-03 20:27:07.184222', 'account-123', 'Deposited', '{"time": "2000-01-01T00:00:00.001Z", "amount": 11, "sequence": 3, "accountId": "123", "depositId": "59714c20-2c48-4e4f-beac-19eca95f3f36", "processedTime": "2023-03-03T20:27:07.171Z"}', '{"causationMessagePosition": 0, "causationMessageStreamName": "accountTransaction-59714c20-2c48-4e4f-beac-19eca95f3f36", "causationMessageGlobalPosition": 3}', '35ac8bf2-b996-4321-8fea-a260d676e5f9');
INSERT INTO message_store.messages VALUES (6, 1, '2023-03-03 20:27:07.268836', 'account:command-123', 'Withdraw', '{"time": "2023-03-03T20:27:07.257Z", "amount": 11, "accountId": "123", "withdrawalId": "df068de5-658c-4a1b-8ca1-b87b2be8b0e2"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 0, "causationMessageStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessageGlobalPosition": 4}', '3146d21c-3697-4ab2-8b48-cf33897e3354');
INSERT INTO message_store.messages VALUES (7, 0, '2023-03-03 20:27:07.358725', 'accountTransaction-df068de5-658c-4a1b-8ca1-b87b2be8b0e2', 'Withdraw', '{"time": "2023-03-03T20:27:07.257Z", "amount": 11, "accountId": "123", "withdrawalId": "df068de5-658c-4a1b-8ca1-b87b2be8b0e2"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 1, "causationMessageStreamName": "account:command-123", "causationMessageGlobalPosition": 6}', '69d7516a-e066-49e2-bdb4-d2e5f0b25826');
INSERT INTO message_store.messages VALUES (8, 1, '2023-03-03 20:27:07.479178', 'account-123', 'Withdrawn', '{"time": "2023-03-03T20:27:07.257Z", "amount": 11, "sequence": 7, "accountId": "123", "withdrawalId": "df068de5-658c-4a1b-8ca1-b87b2be8b0e2", "processedTime": "2023-03-03T20:27:07.469Z"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 0, "causationMessageStreamName": "accountTransaction-df068de5-658c-4a1b-8ca1-b87b2be8b0e2", "causationMessageGlobalPosition": 7}', '8dbf3aac-d0a8-4e47-8341-e77b0d118b20');
INSERT INTO message_store.messages VALUES (9, 1, '2023-03-03 20:27:07.515665', 'fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955', 'Withdrawn', '{"time": "2023-03-03T20:27:07.257Z", "amount": 11, "accountId": "123", "withdrawalId": "df068de5-658c-4a1b-8ca1-b87b2be8b0e2", "processedTime": "2023-03-03T20:27:07.502Z", "fundsTransferId": "7a28081d-4adc-4207-8d7c-5f70aa423955"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 1, "causationMessageStreamName": "account-123", "causationMessageGlobalPosition": 8}', 'c7a97d28-afd0-43cc-bafb-abc712ad6f92');
INSERT INTO message_store.messages VALUES (10, 0, '2023-03-03 20:27:07.591589', 'account:command-456', 'Deposit', '{"time": "2023-03-03T20:27:07.578Z", "amount": 11, "accountId": "456", "depositId": "cd543c5b-7f0b-4a68-bb64-b229d5fca117"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 1, "causationMessageStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessageGlobalPosition": 9}', '0d84ed8e-227d-4f15-a7d6-7c90cddd5f5e');
INSERT INTO message_store.messages VALUES (11, 0, '2023-03-03 20:27:07.662705', 'accountTransaction-cd543c5b-7f0b-4a68-bb64-b229d5fca117', 'Deposit', '{"time": "2023-03-03T20:27:07.578Z", "amount": 11, "accountId": "456", "depositId": "cd543c5b-7f0b-4a68-bb64-b229d5fca117"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 0, "causationMessageStreamName": "account:command-456", "causationMessageGlobalPosition": 10}', '717e6c94-4304-4f4e-a2b5-c5016cd2d50d');
INSERT INTO message_store.messages VALUES (12, 0, '2023-03-03 20:27:07.792601', 'account-456', 'Deposited', '{"time": "2023-03-03T20:27:07.578Z", "amount": 11, "sequence": 11, "accountId": "456", "depositId": "cd543c5b-7f0b-4a68-bb64-b229d5fca117", "processedTime": "2023-03-03T20:27:07.778Z"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 0, "causationMessageStreamName": "accountTransaction-cd543c5b-7f0b-4a68-bb64-b229d5fca117", "causationMessageGlobalPosition": 11}', '0efe135c-0889-480c-a0c7-6741787a4be9');
INSERT INTO message_store.messages VALUES (13, 2, '2023-03-03 20:27:07.92623', 'fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955', 'Deposited', '{"time": "2023-03-03T20:27:07.578Z", "amount": 11, "accountId": "456", "depositId": "cd543c5b-7f0b-4a68-bb64-b229d5fca117", "processedTime": "2023-03-03T20:27:07.913Z", "fundsTransferId": "7a28081d-4adc-4207-8d7c-5f70aa423955"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 0, "causationMessageStreamName": "account-456", "causationMessageGlobalPosition": 12}', '3c1eccf9-d8dc-4c84-a3df-c8c816cb05bf');
INSERT INTO message_store.messages VALUES (14, 3, '2023-03-03 20:27:07.998264', 'fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955', 'Transferred', '{"time": "2023-03-03T20:27:07.578Z", "amount": 11, "depositId": "cd543c5b-7f0b-4a68-bb64-b229d5fca117", "withdrawalId": "df068de5-658c-4a1b-8ca1-b87b2be8b0e2", "processedTime": "2023-03-03T20:27:07.984Z", "fundsTransferId": "7a28081d-4adc-4207-8d7c-5f70aa423955", "depositAccountId": "456", "withdrawalAccountId": "123"}', '{"correlationStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessagePosition": 2, "causationMessageStreamName": "fundsTransfer-7a28081d-4adc-4207-8d7c-5f70aa423955", "causationMessageGlobalPosition": 13}', '2391c329-37c4-4b04-b8b0-b453a8981f0f');


--
-- Name: messages_global_position_seq; Type: SEQUENCE SET; Schema: message_store; Owner: postgres
--

SELECT pg_catalog.setval('message_store.messages_global_position_seq', 14, true);


--
-- PostgreSQL database dump complete
--

