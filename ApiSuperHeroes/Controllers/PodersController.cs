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
    public class PodersController : ApiController
    {
        private SuperHeroesEntities db = new SuperHeroesEntities();

        // GET: api/Poders
        public IQueryable<Poder> GetPoder()
        {
            return db.Poder;
        }

        // GET: api/Poders/5
        [ResponseType(typeof(Poder))]
        public IHttpActionResult GetPoder(int id)
        {
            Poder poder = db.Poder.Find(id);
            if (poder == null)
            {
                return NotFound();
            }

            return Ok(poder);
        }

        // PUT: api/Poders/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPoder(int id, Poder poder)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != poder.ID)
            {
                return BadRequest();
            }

            db.Entry(poder).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PoderExists(id))
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

        // POST: api/Poders
        [ResponseType(typeof(Poder))]
        public IHttpActionResult PostPoder(Poder poder)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Poder.Add(poder);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = poder.ID }, poder);
        }

        // DELETE: api/Poders/5
        [ResponseType(typeof(Poder))]
        public IHttpActionResult DeletePoder(int id)
        {
            Poder poder = db.Poder.Find(id);
            if (poder == null)
            {
                return NotFound();
            }

            db.Poder.Remove(poder);
            db.SaveChanges();

            return Ok(poder);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PoderExists(int id)
        {
            return db.Poder.Count(e => e.ID == id) > 0;
        }
    }
}