# ResearchNetworking

To use:

Testing with json format: Copy this format and paste to use at 

http://www.json-generator.com/

//json

{

  "title": "title test",
  
  "items": [{
  
    "ID": 1070164,
    
    "user_name" : "user name test",
    
    "more_items": [
    
      {
      
        "title": "more item title 1",
        
        "ID": 11
        
      },
      
      {
      
        "title": "more item title 2",
        
        "ID": 11
        
      }
      
    ]
    
  }]
  
}


//***Interface: just copy-paste URL generated and press GO button

//***UX

External/

External/API

External/API/APIBase

External/API/APIBase/ApiBusiness.h ~> for define wrap function GET | PUSH | POST | ...

External/API/APIBase/APIController.h ~> controll API and handle success/ response

External/API/APIBase/Common.h  ~> common

External/API/APIBase/Models.h ~> Model (not auto generated)

External/API/APIBase/Request.h ~> Request Object

External/API/APIBase/Response.h ~> Response object (auto generated by json accelerator - parse by APIParserUtil)

External/API/APIBase/Util ~> common Utils

External/API/APIBase/APIConstants ~> define URL
