<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResponseHandling.aspx.cs" Inherits="ResponseHandling" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <!-- Response Parameters
		
	It is absolutely mandatory that the hash (or checksum) is computed again after you receive response from PayU and compare it with request and post back parameters. This will protect you from any tampering by the user and help in ensuring a safe and secure transaction experience. It is mandate that you secure your integration with PayU by implementing Verify webservice and Webhook/callback as a secondary confirmation of transaction response.
		
	For more details please refer PDF...
	
	  1
      mihpayid
      It is a unique reference number created for each transaction at PayU�s end. For every new transaction request that hits PayU�s server (coming from any of our merchants), a unique reference ID is created and it is known as�<strong>mihpayid�(or PayU ID)
    
    
      2
      mode
      This parameter describes the payment category by which the transaction was completed/attempted by the customer. The values are mentioned below:</p>
        
    
      3
      status
      This parameter gives the status of the transaction. Hence, the value of this parameter depends on whether the transaction was successful or not. You must map the order status using this parameter only. The values are as below:
        If the transaction is successful, the value of �status� parameter would be �success�.
		The value of �status� as �failure� or �pending��must be treated as a failed transaction only.
    
    
      4
      key
      This parameter would contain the merchant key for the merchant�s account at PayU. It would be the same as the key used while the transaction request is being posted from merchant�s end to PayU.
    
    
      5
      txnid
      This parameter would contain the transaction ID value posted by the merchant during the transaction request.
    
    
      6
      amount
      This parameter would contain the original amount which was sent in the transaction request by the merchant.
    
      7
      discount
      This parameter would contain the discount given to user - based on the type of offer applied by the merchant.
    
    
      8
      offer
      This parameter would contain the offer key which was sent in the transaction request by the merchant.
    
    
      9
      productinfo
      This parameter would contain the same value of�productinfo�which was sent in the transaction request from merchant�s end to PayU
    
    
      10
      firstname
      This parameter would contain the same value of�firstname�which was sent in the transaction request from merchant�s end to PayU
    
    
      11
      lastname
      This parameter would contain the same value of�lastname�which was sent in the transaction request from merchant�s end to PayU
    
    
      12
      address1
      This parameter would contain the same value of�address1�which was sent in the transaction request from merchant�s end to PayU
    
    
      13
      address2
      This parameter would contain the same value of�address2�which was sent in the transaction request from merchant�s end to PayU
    
    
      14
      city
      This parameter would contain the same value of�city�which was sent in the transaction request from merchant�s end to PayU
    
    
      15
      state
      This parameter would contain the same value of�state�which was sent in the transaction request from merchant�s end to PayU
    
    
      16
      country
      This parameter would contain the same value of�country�which was sent in the transaction request from merchant�s end to PayU
    
    
      17
      zipcode
      This parameter would contain the same value of�zipcode�which was sent in the transaction request from merchant�s end to PayU
    
    
      18
      email
      This parameter would contain the same value of�email�which was sent in the transaction request from merchant�s end to PayU
    
    
      19
      phone
      This parameter would contain the same value of�phone�which was sent in the transaction request from merchant�s end to PayU
    
    
      20
      udf1
      This parameter would contain the same value of�udf1�which was sent in the transaction request from merchant�s end to PayU
    
    
      21
      udf2
      This parameter would contain the same value of�udf2�which was sent in the transaction request from merchant�s end to PayU
    
    
      22
      udf3
      This parameter would contain the same value of�udf3�which was sent in the transaction request from merchant�s end to PayU
    
    
      23
      udf4
      This parameter would contain the same value of�udf4�which was sent in the transaction request from merchant�s end to PayU
    
    
      24
      udf5
      This parameter would contain the same value of�udf5�which was sent in the transaction request from merchant�s end to PayU
    
      25
      hash
      This parameter is absolutely crucial and is similar to the hash parameter used in the transaction request send by the merchant to PayU. PayU calculates the hash using a string of other parameters and returns to the merchant. The merchant must verify the hash and then only mark a transaction as success/failure. This is to make sure that the transaction hasn�t been tampered with. The calculation is as below:
      
        sha512(SALT|status||||||udf5|udf4|udf3|udf2|udf1|email|firstname|productinfo|amount|txnid|key)
        The handling of udf1 � udf5 parameters remains similar to the hash calculation when the merchant sends it in the transaction request to PayU. If any of the udf (udf1-udf5) was posted in the transaction request, it must be taken in hash calculation also.
        If none of the udf parameters were posted in the transaction request, they should be left empty in the hash calculation too.
    
    
      26
      error
      For the failed transactions, this parameter provides the reason of failure. Please note that the reason of failure depends upon the error codes provided by different banks and hence the detailing of error reason may differ from one transaction to another. The merchant can use this parameter to retrieve the reason of failure for a particular transaction.
    
    
      27
      bankcode
      This parameter would contain the code indicating the payment option used for the transaction. For example, in Debit Card mode, there are different options like Visa Debit Card, Mastercard, Maestro etc. For each option, a unique bankcode exists. It would be returned in this bankcode parameter. For example, Visa Debit Card ��VISA,�Master Debit Card ��MAST.
    
    
      28
      PG_TYPE
      This parameter gives information on the payment gateway used for the transaction. For example, if SBI PG was used, it would contain the value�SBIPG.�If SBI Netbanking was used for the transaction, the value of PG_TYPE would be�SBINB. Similarly, it would have a unique value for all different type of payment gateways.
    
    
      29
      bank_ref_num
      For each�successful�transaction � this parameter would contain the�bank reference number�generated by the bank.
    
    
      30
      shipping_firstname
      This parameter would contain the same value of�shipping_firstname�which was sent in the transaction request from merchant�s end to PayU
    
      31
      shipping_lastname
      This parameter would contain the same value of�shipping_lastname�which was sent in the transaction request from merchant�s end to PayU
    
    
      32
      shipping_address1
      This parameter would contain the same value of�shipping_address1�which was sent in the transaction request from merchant�s end to PayU
    
    
      33
      shipping_address2
      This parameter would contain the same value of�shipping_address2�which was sent in the transaction request from merchant�s end to PayU
    
    
      34
      shipping_city
      This parameter would contain the same value of�shipping_city�which was sent in the transaction request from merchant�s end to PayU
    
    
      35
      shipping_state
      This parameter would contain the same value of�shipping_state�which was sent in the transaction request from merchant�s end to PayU
    
    
      36
      shipping_country
      This parameter would contain the same value of�shipping_country�which was sent in the transaction request from merchant�s end to PayU
    
    
      37
      shipping_zipcode
      This parameter would contain the same value of�shipping_zipcode�which was sent in the transaction request from merchant�s end to PayU
    
    
      38
      shipping_phone
      This parameter would contain the same value of�shipping_phone�which was sent in the transaction request from merchant�s end to PayU
    
    
      39
      unmappedstatus
      This parameter contains the status of a transaction as per the internal database of PayU. PayU�s system has several intermediate status which are used for tracking various activities internal to the system. Hence, this status contains intermediate states of a transaction also - and hence is known as�unmappedstatus.
        For example: dropped/bounced/captured/auth/failed/usercancelled/pending
    //-->
</body>
</html>
