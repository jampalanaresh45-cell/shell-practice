#!/bin/bash

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-09c813fb71547fc4f",
            "InstanceId": "i-011c323111709d4e1",
            "InstanceType": "t3.micro",
            "LaunchTime": "2025-09-28T12:47:54+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1d",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-27-112.ec2.internal",
            "PrivateIpAddress": "172.31.27.112",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0ef868e4deffb5165",
            "VpcId": "vpc-061d7a543c4d2ae2b",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "29575ddf-2fd3-421b-a944-4dfda1d6d150",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2025-09-28T12:47:54+00:00",
                        "AttachmentId": "eni-attach-009543d5827b13c14",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "Allow all-ports",
                            "GroupId": "sg-0b27bdc41b21e4e6d"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:ff:e5:79:c2:af",
                    "NetworkInterfaceId": "eni-0e7bba887f9328d3e",
                    "OwnerId": "196061557907",
                    "PrivateDnsName": "ip-172-31-27-112.ec2.internal",
                    "PrivateIpAddress": "172.31.27.112",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-27-112.ec2.internal",
                            "PrivateIpAddress": "172.31.27.112"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0ef868e4deffb5165",
                    "VpcId": "vpc-061d7a543c4d2ae2b",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "Allow all-ports",
                    "GroupId": "sg-0b27bdc41b21e4e6d"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "Test"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 2
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "uefi"
        }
    ],
    "OwnerId": "196061557907",
    "ReservationId": "r-0a3d05801e742f467"
}