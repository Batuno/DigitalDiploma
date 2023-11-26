from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from web3 import Web3, AsyncWeb3
from web3.exceptions import BadFunctionCallOutput
import PyPDF2
import hashlib




def home(request):
    diploma_status = None
    try:
        infura_url = "https://mainnet.infura.io/v3/ff90da82d1e44f6db92e7d40316525fb"
        ganache_url = "HTTP://127.0.0.1:7545"
        w3 = Web3(Web3.HTTPProvider(ganache_url))
        assert True is w3.is_connected()
        print("Network connected")
        contract_address = "0xdD3B043C4f9AEBaf129B7FABdD7A5a44C2096934"
        contract_abi = [
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": False,
		"inputs": [
			{
				"indexed": True,
				"internalType": "address",
				"name": "student",
				"type": "address"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "course",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "enum DigitalDiploma.DiplomaStatus",
				"name": "status",
				"type": "uint8"
			}
		],
		"name": "DiplomaIssued",
		"type": "event"
	},
	{
		"anonymous": False,
		"inputs": [
			{
				"indexed": True,
				"internalType": "address",
				"name": "student",
				"type": "address"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "course",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "enum DigitalDiploma.DiplomaStatus",
				"name": "status",
				"type": "uint8"
			}
		],
		"name": "DiplomaVerified",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "admin",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "diplomas",
		"outputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "course",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"internalType": "enum DigitalDiploma.DiplomaStatus",
				"name": "status",
				"type": "uint8"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_student",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_course",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_email",
				"type": "string"
			}
		],
		"name": "issueDiploma",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]

        

        contract = w3.eth.contract(address=contract_address, abi=contract_abi)

        student_address = "0xE8cDfC0963CF0c8137541738a3d5311085fD01DD"
        diploma_status = contract.functions.diplomas(student_address).call()
        print(f"Student Address: {student_address}, Diploma Status: {diploma_status}")

    except BadFunctionCallOutput as e:
        print(f"BadFunctionCallOutput: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")
    return render(request, "home.html", {"diploma_status": diploma_status})


