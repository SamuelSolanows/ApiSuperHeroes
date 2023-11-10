using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ApiSuperHeroes.Models;

namespace ApiSuperHeroes.Controllers
{
    public class SuperHeroesController : ApiController
    {
        private SuperHeroesEntities db = new SuperHeroesEntities();

        // GET: api/SuperHeroes
        public IQueryable<SuperHeroe> GetSuperHeroe()
        {
            return db.SuperHeroe;
        }

        // GET: api/SuperHeroes/5
        [ResponseType(typeof(SuperHeroe))]
        public IHttpActionResult GetSuperHeroe(int id)
        {
            SuperHeroe superHeroe = db.SuperHeroe.Find(id);
            if (superHeroe == null)
            {
                return NotFound();
            }

            return Ok(superHeroe);
        }

        // PUT: api/SuperHeroes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSuperHeroe(int id, SuperHeroe superHeroe)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != superHeroe.ID)
            {
                return BadRequest();
            }

            db.Entry(superHeroe).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SuperHeroeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/SuperHeroes
        [ResponseType(typeof(SuperHeroe))]
        public IHttpActionResult PostSuperHeroe(SuperHeroe superHeroe)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SuperHeroe.Add(superHeroe);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = superHeroe.ID }, superHeroe);
        }

        // DELETE: api/SuperHeroes/5
        [ResponseType(typeof(SuperHeroe))]
        public IHttpActionResult DeleteSuperHeroe(int id)
        {
            SuperHeroe superHeroe = db.SuperHeroe.Find(id);
            if (superHeroe == null)
            {
                return NotFound();
            }

            db.SuperHeroe.Remove(superHeroe);
            db.SaveChanges();

            return Ok(superHeroe);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SuperHeroeExists(int id)
        {
            return db.SuperHeroe.Count(e => e.ID == id) > 0;
        }
    }
}