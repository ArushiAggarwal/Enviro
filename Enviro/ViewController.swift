//
//  ViewController.swift
//  Enviro
//
//  Created by Arushi Aggarwal on 2/29/20.
//  Copyright © 2020 Arushi Aggarwal. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GMSServices.provideAPIKey("AIzaSyCTMxA6REK9u89EwZrpIzExE3Ntb2J65WM")
        
        let camera = GMSCameraPosition.camera(withLatitude: 36.86, longitude: -122.4, zoom: 12.00)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 36.86, longitude: -122.4)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: Selector(("next")))
        
    }
  //  func next(){
   //     let nextLocation = CLLocationCoordinate2DMake(37.792871, -122.397055)
     //   mapView?.camera = GMSCameraPosition.CameraWithLatitude(nextLocation.latitude, longitude:nextLocation.longitude, zoom: 15)
        
       // let marker = GMSMarker(position: nextLocation)
        //marker.title = "trumps trash"
        
        //marker.map = mapView
    }

