��U S E   [ s 1 5 g u e s t 0 4 ]  
 G O  
  S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p _ 2 _ C l a s s _ T o _ T r a c k ]    
 	 @ t r a c k _ n a m e   V A R C H A R ( 5 0 ) ,  
 	 @ c o u r s e _ t i t l e   V A R C H A R ( 1 0 0 )  
 A S  
 B E G I N   T R Y  
 B E G I N   T R A N  
 	 S E T   N O C O U N T   O N ;  
  
 	 D E C L A R E   @ t r a c k _ v a r i a b l e   I N T ,   @ c o u r s e _ v a r i a b l e   I N T  
 	 S E T   @ t r a c k _ v a r i a b l e   =   (  
 	 S E L E C T   p k _ t r a c k _ i d     - - T r a c k  
 	 F R O M   d b o . T r a c k  
 	 W H E R E   n a m e   =   @ t r a c k _ n a m e )  
  
 	 S E T   @ c o u r s e _ v a r i a b l e   =   (  
 	 S E L E C T   p k _ c o u r s e _ i d     - - C l a s s  
 	 F R O M   d b o . C o u r s e  
 	 W H E R E   t i t l e   =   @ c o u r s e _ t i t l e   )  
  
 	 U P D A T E   d b o . C o u r s e  
 	 S E T   f k _ t r a c k _ i d   =   @ t r a c k _ v a r i a b l e  
 	 O U T P U T   D E L E T E D . f k _ t r a c k _ i d ,   I N S E R T E D . f k _ t r a c k _ i d  
 	 W H E R E   p k _ c o u r s e _ i d   =   @ c o u r s e _ v a r i a b l e  
  
  
 	  
 C O M M I T   T R A N  
 E N D   T R Y  
 B E G I N   C A T C H  
 R O L L B A C K   T R A N  
 P R I N T   ' C u s t o m   P r o c e d u r e 2     f a i l e d '  
 P R I N T   E R R O R _ M E S S A G E ( )  
 E N D   C A T C H  
 
